sealed class AppException implements Exception {
  AppException(this.statusCode, this.message);
  final String statusCode;
  final String message;

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException({
    required String statusCode,
    required String message,
  }) : super(statusCode, message);
}
