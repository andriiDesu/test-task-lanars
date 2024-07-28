import 'package:lanars_test/data/model/remote/user_log_in_request_dto.dart';
import 'package:lanars_test/data/source/remote/api/authorization_api/authorization_api.dart';
import 'package:lanars_test/domain/models/user_data.dart';
import 'package:lanars_test/domain/models/user_log_in_request.dart';

class AuthorizationRepository {
  AuthorizationRepository(this._authorizationApi);

  final AuthorizationApi _authorizationApi;

  Future<UserData> getUser(UserLogInRequest logInRequest) async {
    final requestDto = _toUserLogInRequestDto(logInRequest);

    final response = await _authorizationApi.getUserData(requestDto);

    return response.toUserData();
  }

  UserLogInRequestDto _toUserLogInRequestDto(UserLogInRequest logInRequest) {
    return UserLogInRequestDto(
      email: logInRequest.email,
      password: logInRequest.password,
    );
  }
}
