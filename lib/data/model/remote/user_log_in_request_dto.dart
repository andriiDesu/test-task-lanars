import 'package:json_annotation/json_annotation.dart';

part 'user_log_in_request_dto.g.dart';

@JsonSerializable(createFactory: false)
class UserLogInRequestDto {
  UserLogInRequestDto({
    required this.email,
    required this.password,
  });

  static const _nameKey = 'email';
  static const _passwordKey = 'password';

  @JsonKey(name: _nameKey)
  final String email;
  @JsonKey(name: _passwordKey)
  final String password;

  Map<String, dynamic> toJson() => _$UserLogInRequestDtoToJson(this);
}
