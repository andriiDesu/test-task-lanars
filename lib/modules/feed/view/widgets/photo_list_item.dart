import 'package:flutter/material.dart';
import 'package:lanars_test/domain/models/curated_photo.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({
    required this.curatedPhoto,
    this.width,
    this.margin = const EdgeInsets.only(top: 8),
    super.key,
  });

  final CuratedPhoto curatedPhoto;
  final double? width;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorConst.sysLightOutlineVariant,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              curatedPhoto.image.mediumImage,
              height: 56,
              width: 56,
              cacheHeight: 100,
              cacheWidth: 100,
              filterQuality: FilterQuality.none,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  curatedPhoto.photographer,
                  style: StylesConst.bodyLargeSysLightOnSurface,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  curatedPhoto.title,
                  maxLines: 2,
                  style: StylesConst.bodyMediumSysLightOnSurfaceVariant,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
