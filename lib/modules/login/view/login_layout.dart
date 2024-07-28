import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/core/extensions/build_context_extension.dart';
import 'package:lanars_test/domain/enums/validator_enum.dart';
import 'package:lanars_test/domain/models/user_log_in_request.dart';
import 'package:lanars_test/modules/common/bloc/base_bloc.dart';
import 'package:lanars_test/modules/common/view/base_layout.dart';
import 'package:lanars_test/modules/common/view/widgets/default_button.dart';
import 'package:lanars_test/modules/common/view/widgets/default_text_field.dart';
import 'package:lanars_test/modules/login/bloc/login_bloc.dart';
import 'package:lanars_test/resources/constants/styles.dart';

class LoginLayout extends BaseLayout {
  const LoginLayout({super.key});

  @override
  State<StatefulWidget> createState() => _LoginLayoutState();
}

class _LoginLayoutState
    extends BaseLayoutState<LoginState, LoginLayout, LoginEvent, LoginBloc> {
  late final TextEditingController _emailController;
  late final FocusNode _emailFocus;
  late final TextEditingController _passwordController;
  late final FocusNode _passwordFocus;

  @override
  bool get resizeContentOnKeyboard => true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(() {
      if(bloc.state.hasErrors) {
        bloc.add(ClearErrorEvent(clearEmail: true));
      }
    });
    _passwordController = TextEditingController()..addListener(() {
      if(bloc.state.hasErrors) {
        bloc.add(ClearErrorEvent(clearPassword: true));
      }
    });
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  Widget buildLayout(BuildContext context) {
    return BlocBuilder<ProgressCubit, bool>(
      bloc: bloc.progressCubit,
      builder: (_, inProgress) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 15,
            ),
            const Text(
              'Sign in',
              style: StylesConst.headlineLargeSysLightOnSurface,
            ),
            const Spacer(
              flex: 3,
            ),
            BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
              return Column(
                children: [
                  DefaultTextFormField(
                    hasError: state.hasEmailError,
                    labelText: 'Email',
                    inProgress: inProgress,
                    focusNode: _emailFocus,
                    controller: _emailController,
                    hintText: 'Enter your email',
                    validatorEnum: ValidatorEnum.email,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: DefaultTextFormField(
                      hasError: state.hasPasswordError,
                      labelText: 'Password',
                      inProgress: inProgress,
                      focusNode: _passwordFocus,
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      validatorEnum: ValidatorEnum.password,
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 24,
            ),
            DefaultButton(
              label: 'Log in',
              inProgress: inProgress,
              onTap: _onLogInPressed,
            ),
            const Spacer(
              flex: 25,
            ),
          ],
        );
      },
    );
  }

  void _onLogInPressed() {
    context.clearFocus();
    final logInRequest = UserLogInRequest(
      email: _emailController.text,
      password: _passwordController.text,
    );

    bloc.add(
      SignInEvent(
        logInRequest: logInRequest,
      ),
    );
  }
}
