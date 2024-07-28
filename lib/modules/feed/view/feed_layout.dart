import 'package:flutter/material.dart';
import 'package:lanars_test/modules/common/view/base_layout.dart';
import 'package:lanars_test/modules/feed/bloc/feed_bloc.dart';

class FeedLayout extends BaseLayout {
  const FeedLayout({super.key});

  @override
  State<StatefulWidget> createState() =>
      _FeedLayoutState();
}

class _FeedLayoutState extends BaseLayoutState<FeedState, FeedLayout, FeedEvent,
    FeedBloc> {
  @override
  void onInit() {
    super.onInit();
    bloc.add(GetPhotosEvent());
  }

  @override
  Widget buildLayout(BuildContext context) {
    return const Column();
  }
}
