import 'failure.dart';

/// General remote failures
class ServerFailure extends Failure {
  String? message;

  ServerFailure({
    required super.statusCode,
    this.message,
  });

  factory ServerFailure.fromMap(Map<String, dynamic> json) {
    return ServerFailure(
      statusCode: json['statusCode'] ?? '',
    );
  }
}
