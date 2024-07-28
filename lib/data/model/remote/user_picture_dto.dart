import 'package:json_annotation/json_annotation.dart';
import 'package:lanars_test/domain/models/user_picture.dart';

part 'user_picture_dto.g.dart';

@JsonSerializable(createToJson: false)
class UserPictureDto {
  UserPictureDto({
    required this.large,
  });

  factory UserPictureDto.fromJson(Map<String, dynamic> data) => _$UserPictureDtoFromJson(data);

  static const _largeKey = 'large';

  @JsonKey(name: _largeKey)
  final String large;

  UserPicture toUserPicture() {
    return UserPicture(large: large);
  }
}
