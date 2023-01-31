import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/serializers/date_time_converter.dart';
import 'package:typedefs/typedefs.dart';

export './create_user_dto/create_user_dto.dart';
export './login_user_dto/login_user_dto.dart';

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
    @DateTimeConverter() required DateTime createdAt,
    @Default('') @JsonKey(includeToJson: false) String password,
  }) = _User;

  /// {@macro user}
  /// Create a [User] from a json object.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
