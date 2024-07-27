import 'package:flutter/material.dart';
import 'package:lanars_test/core/navigation/route_state.dart';
import 'package:lanars_test/modules/common/view/base_screen.dart';
import 'package:lanars_test/modules/login/bloc/login_bloc.dart';
import 'package:lanars_test/modules/login/view/login_layout.dart';

class LoginScreen extends BaseScreen<LoginState, LoginEvent, LoginBloc, LoginLayout> {
  const LoginScreen({super.key});

  static const routeName = '/Login_screen';

  @override
  LoginLayout get layout => const LoginLayout();

  @override
  LoginBloc get bloc => LoginBloc();

  @override
  void onRoute(BuildContext context, RouteState state) {
    super.onRoute(context, state);
  }
}
