import 'package:lanars_test/data/model/remote/user_log_in_request_dto.dart';
import 'package:lanars_test/data/source/remote/api/authorization_api/authorization_api.dart';
import 'package:lanars_test/domain/models/user_data.dart';
import 'package:lanars_test/domain/models/user_log_in_request.dart';

class AuthorizationRepository {
  AuthorizationRepository(this._authorizationApi);

  final AuthorizationApi _authorizationApi;

  ///Method used to get user data from API.
  Future<UserData> getUser(UserLogInRequest logInRequest) async {
    final requestDto = _toUserLogInRequestDto(logInRequest);

    final response = await _authorizationApi.getUserData(requestDto);

    return response.toUserData();
  }

  ///Helper method used to turn model from bloc into a data transfer object.
  UserLogInRequestDto _toUserLogInRequestDto(UserLogInRequest logInRequest) {
    return UserLogInRequestDto(
      email: logInRequest.email,
      password: logInRequest.password,
    );
  }
}
