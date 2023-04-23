import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/user/user.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

/// A class representing a authenticated user.
@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  /// {@macro authenticated_user_dto}
  const factory AuthenticatedUser({
    required String token,
    required User user,
  }) = _AuthenticatedUser;

  /// {@macro authenticated_user_dto}
  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserFromJson(json);
}
