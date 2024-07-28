// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuratedPhotoDto _$CuratedPhotoDtoFromJson(Map<String, dynamic> json) =>
    CuratedPhotoDto(
      json['photographer'] as String,
      json['alt'] as String,
      CuratedPhotoImageDto.fromJson(json['src'] as Map<String, dynamic>),
    );
