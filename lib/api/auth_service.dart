import 'dart:convert';
import 'package:http/http.dart';
import 'package:recipie_flutter/constants/api.dart';
import 'package:recipie_flutter/models/error_model.dart';
import 'package:recipie_flutter/models/success_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  Client client = Client();

  Future login(Object params) async {
    final response =
        await client.post(Uri.parse(apiUrl + 'auth/login'), body: params);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'failed') {
        return Error(error: true, message: data['message']);
      }

      preferences.then((SharedPreferences prefs) =>
          {prefs.setString('token', data['token'])});

      return Success(success: true, message: data['message']);
    }
  }

  Future getUsers() async {
    final response = await client.get(Uri.parse(apiUrl + '/login'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['users'].map((item) {
        // return News(
        //     image: item['urlToImage'],
        //     title: item['title'],
        //     description: item['description'],
        //     source: item['source']['name'],
        //     published: item['publishedAt']);
      }).toList();
    }
  }
}
