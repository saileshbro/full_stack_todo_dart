/// {@template failure}
/// Base class for all failures.
/// {@endtemplate}
abstract class Failure {
  /// Failure message.
  String get message;

  /// Failure status code.
  int get statusCode;
}
