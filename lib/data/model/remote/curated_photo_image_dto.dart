import 'package:json_annotation/json_annotation.dart';
import 'package:lanars_test/domain/models/curated_photo_image.dart';

part 'curated_photo_image_dto.g.dart';

@JsonSerializable(createToJson: false)
class CuratedPhotoImageDto {
  CuratedPhotoImageDto(this.mediumImage);

  factory CuratedPhotoImageDto.fromJson(Map<String, dynamic> data) =>
      _$CuratedPhotoImageDtoFromJson(data);

  static const _imageKey = 'medium';

  @JsonKey(name: _imageKey)
  final String mediumImage;

  CuratedPhotoImage toCuratedPhotoImage() {
    return CuratedPhotoImage(
      mediumImage: mediumImage,
    );
  }
}
