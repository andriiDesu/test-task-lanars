import 'package:flutter/material.dart';
import 'package:lanars_test/domain/enums/validator_enum.dart';
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
  @override
  Widget buildLayout(BuildContext context) {
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
        const DefaultTextFormField(
          labelText: 'Email',
          hintText: 'Enter your email',
          validatorEnum: ValidatorEnum.email,
        ),
        const DefaultTextFormField(
          labelText: 'Password',
          hintText: 'Enter your password',
          validatorEnum: ValidatorEnum.password,
        ),
        const SizedBox(
          height: 44,
        ),
        DefaultButton(
          label: 'Log in',
          onTap: _onLogInPressed,
        ),
        const Spacer(
          flex: 25,
        ),
      ],
    );
  }

  void _onLogInPressed() {}
}
