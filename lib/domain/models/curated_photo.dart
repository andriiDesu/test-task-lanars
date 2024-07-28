import 'package:flutter/material.dart';
import 'package:lanars_test/domain/models/curated_photo_image.dart';

@immutable
class CuratedPhoto {
  const CuratedPhoto({
    required this.photographer,
    required this.title,
    required this.image,
  });

  final String photographer;
  final String title;
  final CuratedPhotoImage image;
}
