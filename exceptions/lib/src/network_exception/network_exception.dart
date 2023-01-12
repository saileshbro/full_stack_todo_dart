/// {@template network_exception}
/// This is the class for the network from frontend
/// This will serialize the error from the backend
/// {@endtemplate}
class NetworkException implements Exception {
  /// {@macro network_exception}
  NetworkException({
    required this.message,
    required this.statusCode,
    this.errors = const {},
  });

  /// The message to be displayed
  final String message;

  /// The status code of the error
  final int statusCode;

  /// The errors from the backend
  final Map<String, List<String>> errors;
}
