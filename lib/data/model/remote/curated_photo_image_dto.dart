import 'package:json_annotation/json_annotation.dart';
import 'package:lanars_test/domain/models/curated_photo_image.dart';

part 'curated_photo_image_dto.g.dart';

@JsonSerializable(createToJson: false)
class CuratedPhotoImageDto {
  CuratedPhotoImageDto(this.smallImage);

  factory CuratedPhotoImageDto.fromJson(Map<String, dynamic> data) =>
      _$CuratedPhotoImageDtoFromJson(data);

  static const _imageKey = 'tiny';

  @JsonKey(name: _imageKey)
  final String smallImage;

  CuratedPhotoImage toCuratedPhotoImage() {
    return CuratedPhotoImage(
      mediumImage: smallImage,
    );
  }
}
