sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException({
    required String code,
    required String message,
  }) : super(code, message);
}
