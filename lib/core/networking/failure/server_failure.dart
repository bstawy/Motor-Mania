/// General remote failures
class ServerFailure {
  int? statusCode;
  String? message;

  ServerFailure({
    this.statusCode,
    this.message,
  });

  factory ServerFailure.fromMap(Map<String, dynamic> json) {
    return ServerFailure(
      statusCode: json['statusCode'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
