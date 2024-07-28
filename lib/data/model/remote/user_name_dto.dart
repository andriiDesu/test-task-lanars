import 'package:json_annotation/json_annotation.dart';
import 'package:lanars_test/domain/models/user_name.dart';

part 'user_name_dto.g.dart';

@JsonSerializable(createToJson: false)
class UserNameDto {
  UserNameDto({
    required this.firstName,
    required this.lastName,
  });

  factory UserNameDto.fromJson(Map<String, dynamic> data) =>
      _$UserNameDtoFromJson(data);

  static const _firstNameKey = 'first';
  static const _lastNameKey = 'last';

  @JsonKey(name: _firstNameKey)
  final String firstName;
  @JsonKey(name: _lastNameKey)
  final String lastName;

  UserName toUserName() {
    return UserName(
      firstName: firstName,
      lastName: lastName,
    );
  }
}
