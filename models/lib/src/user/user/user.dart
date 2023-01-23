import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/serializers/anything_to_null.dart';
import 'package:typedefs/typedefs.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// {@template user}
/// A class representing a user.
/// {@endtemplate}
@freezed
class User with _$User {
  /// {@macro user}
  const factory User({
    required UserId id,
    required String name,
    required String email,
    required DateTime createdAt,
    @JsonKey(toJson: anythingToNull) required String password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
