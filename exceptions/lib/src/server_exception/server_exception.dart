/// {@template server_exception}
/// This is the class for the server exception (500)
/// {@endtemplate}
class ServerException implements Exception {
  /// {@macro server_exception}
  const ServerException(this.message);

  /// The message to be displayed
  final String message;
  @override
  String toString() => 'ServerException: $message';
}
