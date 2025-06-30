class CustomTypeError implements Exception {
  final String? message;
  final String? runtime;
  final StackTrace? stackTrace;

  CustomTypeError({
    this.message,
    this.runtime,
    this.stackTrace,
  });
}

class CustomNetworkErrorException implements Exception {
  final String message = "No Internet Connection";
}

class CustomException implements Exception {
  final String message;
  CustomException({required this.message});
}
