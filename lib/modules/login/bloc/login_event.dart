part of 'login_bloc.dart';

class LoginEvent extends BaseEvent {}

class SignInEvent extends LoginEvent {
  SignInEvent({
    required this.logInRequest,
  });

  final UserLogInRequest logInRequest;
}

class ClearErrorEvent extends LoginEvent {
  ClearErrorEvent({
    this.clearEmail = false,
    this.clearPassword = false,
  });

  final bool clearEmail;
  final bool clearPassword;
}
