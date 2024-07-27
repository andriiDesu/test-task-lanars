import 'package:lanars_test/modules/common/bloc/base_bloc.dart';

part 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends BaseBloc<LoginState, LoginEvent> {
  LoginBloc() : super(const LoginState());
}
