import 'package:flutter/material.dart';
import 'package:lanars_test/core/di/dependency_provider.dart';
import 'package:lanars_test/core/navigation/route_state.dart';
import 'package:lanars_test/modules/common/view/base_screen.dart';
import 'package:lanars_test/modules/feed/view/feed_screen.dart';
import 'package:lanars_test/modules/login/bloc/login_bloc.dart';
import 'package:lanars_test/modules/login/view/login_layout.dart';

class LoginScreen
    extends BaseScreen<LoginState, LoginEvent, LoginBloc, LoginLayout> {
  const LoginScreen({super.key});

  static const routeName = '/';

  @override
  LoginLayout get layout => const LoginLayout();

  @override
  LoginBloc get bloc => LoginBloc(get());

  @override
  void onRoute(BuildContext context, RouteState state) {
    super.onRoute(context, state);
    if (state is PictureListRouteState) {
      Navigator.of(context).pushReplacementNamed(FeedScreen.routeName);
    }
  }
}
