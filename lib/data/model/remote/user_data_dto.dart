import 'package:json_annotation/json_annotation.dart';
import 'package:lanars_test/data/model/remote/user_name_dto.dart';
import 'package:lanars_test/data/model/remote/user_picture_dto.dart';
import 'package:lanars_test/domain/models/user_data.dart';

part 'user_data_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class UserDataDto {
  UserDataDto({
    required this.name,
    required this.picture,
    required this.email,
  });

  factory UserDataDto.fromJson(Map<String, dynamic> data) =>
      _$UserDataDtoFromJson(data);

  static const _nameKey = 'name';
  static const _emailNameKey = 'email';
  static const _pictureKey = 'picture';

  @JsonKey(name: _nameKey)
  final UserNameDto name;
  @JsonKey(name: _pictureKey)
  final UserPictureDto picture;
  @JsonKey(name: _emailNameKey)
  final String email;

  UserData toUserData() {
    return UserData(
      name: name.toUserName(),
      email: email,
      profileImage: picture.toUserPicture(),
    );
  }
}
