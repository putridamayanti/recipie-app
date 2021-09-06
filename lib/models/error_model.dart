class Error {
  final error;
  final message;

  Error({this.error, this.message});

  factory Error.fromJson(Map json) {
    return new Error(error: true, message: json['message']);
  }
}
