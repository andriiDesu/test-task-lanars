import 'package:json_annotation/json_annotation.dart';
import 'package:lanars_test/data/model/remote/curated_photo_image_dto.dart';
import 'package:lanars_test/domain/models/curated_photo.dart';

part 'curated_photo_dto.g.dart';

@JsonSerializable(createToJson: false)
class CuratedPhotoDto {
  CuratedPhotoDto(this.photographer, this.title, this.image);

  factory CuratedPhotoDto.fromJson(Map<String, dynamic> data) =>
      _$CuratedPhotoDtoFromJson(data);

  static const _photographerKey = 'photographer';
  static const _titleKey = 'alt';
  static const _imageKey = 'src';

  @JsonKey(name: _photographerKey)
  final String photographer;
  @JsonKey(name: _titleKey)
  final String title;
  @JsonKey(name: _imageKey)
  final CuratedPhotoImageDto image;

  CuratedPhoto toCuratedPhoto() {
    return CuratedPhoto(
      photographer: photographer,
      title: title,
      image: image.toCuratedPhotoImage(),
    );
  }
}
