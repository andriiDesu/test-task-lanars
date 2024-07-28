import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/modules/common/view/base_layout.dart';
import 'package:lanars_test/modules/feed/bloc/feed_bloc.dart';
import 'package:lanars_test/modules/feed/view/widgets/feed_app_bar.dart';
import 'package:lanars_test/modules/feed/view/widgets/feed_list.dart';

class FeedLayout extends BaseLayout {
  const FeedLayout({super.key});

  @override
  State<StatefulWidget> createState() => _FeedLayoutState();
}

class _FeedLayoutState
    extends BaseLayoutState<FeedState, FeedLayout, FeedEvent, FeedBloc> {
  @override
  void onInit() {
    super.onInit();
    bloc.add(GetPhotosEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const FeedAppBar();
  }

  @override
  Widget buildLayout(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => bloc.add(GetPhotosEvent()),
      child: LayoutBuilder(builder: (context, constraints) {
        return Scrollbar(
          radius: const Radius.circular(21),
          child: BlocBuilder<FeedBloc, FeedState>(
            builder: (_, state) {

              return FeedList(
                photos: state.curatedPhotos,
                constraints: constraints,
              );
            },
          ),
        );
      }),
    );
  }
}
