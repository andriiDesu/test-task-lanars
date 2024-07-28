import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_test/core/navigation/route_state.dart';
import 'package:lanars_test/core/util/validator_util.dart';
import 'package:lanars_test/data/repository/authorization_repository.dart';
import 'package:lanars_test/domain/models/user_data.dart';
import 'package:lanars_test/domain/models/user_log_in_request.dart';
import 'package:lanars_test/modules/common/bloc/base_bloc.dart';

part 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends BaseBloc<LoginState, LoginEvent> {
  LoginBloc(this._authorizationRepository) : super(const LoginState()) {
    on<SignInEvent>(_onSignIn);
    on<ClearErrorEvent>(_clearError);
  }

  final AuthorizationRepository _authorizationRepository;

  void _onSignIn(SignInEvent event, Emitter<LoginState> emit) async {
    final passwordValidationResult =
        ValidatorUtil.validatePassword(event.logInRequest.password);
    final emailValidationResult =
        ValidatorUtil.validateEmail(event.logInRequest.email);

    if (passwordValidationResult != null || emailValidationResult != null) {
      emit(
        LoginState(
          hasEmailError: emailValidationResult != null,
          hasPasswordError: passwordValidationResult != null,
        ),
      );

      return;
    }

    await execute<UserData>(
      _authorizationRepository.getUser(event.logInRequest),
      retry: () => _onSignIn(event, emit),
      onSuccess: (result) {
        addRoute(PictureListRouteState(result));
      },
    );
  }

  void _clearError(ClearErrorEvent event, Emitter<LoginState> emit) {
    emit(
      LoginState(
        hasPasswordError: !event.clearPassword,
        hasEmailError: !event.clearEmail,
      ),
    );
  }
}
