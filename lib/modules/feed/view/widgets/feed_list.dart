import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/domain/models/curated_photo.dart';
import 'package:lanars_test/modules/feed/bloc/feed_bloc.dart';
import 'package:lanars_test/modules/feed/view/widgets/photo_list_item.dart';
import 'package:lanars_test/resources/constants/colors.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class FeedList extends StatefulWidget {
  const FeedList({
    required this.photos,
    required this.constraints,
    super.key,
  });

  final List<CuratedPhoto> photos;
  final BoxConstraints constraints;

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  String _currentCategory = '';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      cacheExtent: 90,
      addRepaintBoundaries: false,
      addAutomaticKeepAlives: false,
      itemExtent: widget.photos.isEmpty ? widget.constraints.maxHeight : 90,
      itemCount: widget.photos.isEmpty ? 1 : widget.photos.length,
      itemBuilder: (_, index) {
        final bloc = context.read<FeedBloc>();
        if (bloc.progressCubit.state) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorConst.sysLightPrimary,
            ),
          );
        }

        if (widget.photos.isEmpty) {
          return const Center(
            child: Text(
              'No images available, try again later',
              style: StylesConst.titleLargeSysLightOnSurface,
            ),
          );
        }

        final item = widget.photos[index];
        final firstLetter = item.photographer.substring(0, 1);

        if (index == 0) {
          _currentCategory = '';
        }

        if (_currentCategory != firstLetter) {
          _currentCategory = firstLetter;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                firstLetter,
                style: StylesConst.titleMediumSysLightInverseOnSurface,
              ),
              const SizedBox(
                width: 16,
              ),
              PhotoListItem(
                width: widget.constraints.maxWidth - 32,
                curatedPhoto: item,
              ),
            ],
          );
        }

        return PhotoListItem(
          curatedPhoto: item,
          margin: const EdgeInsets.only(
            left: 27,
            top: 8,
            right: 6,
          ),
        );
      },
    );
  }
}
