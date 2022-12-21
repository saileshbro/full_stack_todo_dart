import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failure.freezed.dart';
part 'network_failure.g.dart';

@Freezed(toStringOverride: false)

/// {@template network_failure}
/// Failure that occurs when a network request fails.
/// {@endtemplate}
class NetworkFailure extends Failure with _$NetworkFailure {
  /// {@macro network_failure}
  const factory NetworkFailure({
    required String message,
    required int code,
    @Default([]) List<String> errors,
  }) = _NetworkFailure;

  /// Returns a [NetworkFailure] from a json map.
  factory NetworkFailure.fromJson(Map<String, dynamic> json) =>
      _$NetworkFailureFromJson(json);
}
