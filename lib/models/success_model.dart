class Success {
  final success;
  final message;

  Success({this.success, this.message});

  factory Success.fromJson(Map json) {
    return new Success(success: true, message: json['message']);
  }
}
