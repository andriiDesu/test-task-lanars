import 'package:flutter/material.dart';
import 'package:lanars_test/core/di/dependency_provider.dart';
import 'package:lanars_test/core/navigation/route_state.dart';
import 'package:lanars_test/modules/common/view/base_screen.dart';
import 'package:lanars_test/modules/feed/bloc/feed_bloc.dart';
import 'package:lanars_test/modules/feed/view/feed_layout.dart';

class FeedScreen
    extends BaseScreen<FeedState, FeedEvent, FeedBloc, FeedLayout> {
  const FeedScreen({super.key});

  static const routeName = '/feed_screen';

  @override
  FeedLayout get layout => const FeedLayout();

  @override
  void onRoute(BuildContext context, RouteState state) {
    super.onRoute(context, state);
  }

  @override
  FeedBloc get bloc => FeedBloc(get());
}
