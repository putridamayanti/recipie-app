class User {
  final fullname;
  final email;
  final username;
  final password;

  User({this.fullname, this.email, this.username, this.password});

  factory User.fromJson(Map json) {
    return new User(
        fullname: json['fullname'],
        email: json['email'],
        username: json['username'],
        password: json['password']);
  }
}
