class ApiErrorModel {
  int? statusCode;
  String? message;
  dynamic data;

  ApiErrorModel({
    this.statusCode,
    this.message,
    this.data,
  });
}
