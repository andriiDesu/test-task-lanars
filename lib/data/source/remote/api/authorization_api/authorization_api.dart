import 'package:lanars_test/data/model/remote/user_data_dto.dart';
import 'package:lanars_test/data/model/remote/user_log_in_request_dto.dart';
import 'package:lanars_test/data/source/remote/api/authorization_api/authorization_network_service.dart';
import 'package:lanars_test/data/source/remote/api/network_service.dart';

class AuthorizationApi {
  AuthorizationApi(this._authNetworkService);

  final AuthorizationNetworkService _authNetworkService;
  static const _getUserPath = '';

  Future<UserDataDto> getUserData(UserLogInRequestDto logInRequest) {
    return _authNetworkService.request(
      _getUserPath,
      HttpMethod.get,
      data: logInRequest.toJson(),
      onParse: (response) {
        final responseData = response.data['results'] as List<dynamic>;

        return UserDataDto.fromJson(responseData.first);
      },
    );
  }
}
