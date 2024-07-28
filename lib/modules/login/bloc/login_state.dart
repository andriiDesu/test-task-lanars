part of 'login_bloc.dart';

class LoginState extends BaseState {
  const LoginState({
    this.hasEmailError = false,
    this.hasPasswordError = false,
  });

  final bool hasEmailError;
  final bool hasPasswordError;

  bool get hasErrors => hasEmailError || hasPasswordError;
}
