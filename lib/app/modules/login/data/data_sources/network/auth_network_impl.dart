import 'package:fe_football/app/modules/login/data/data_sources/network/auth_network.dart';
import 'package:fe_football/app/modules/login/data/models/login_request/login_request.dart';
import 'package:fe_football/app/modules/login/data/models/login_response/login_response.dart';
import 'package:fe_football/utils/future/future_util.dart';
import 'package:fe_football/utils/network/base_networking.dart';

class AuthNetworkImpl implements AuthNetwork {
  final BaseNetworking _baseNetworking = BaseNetworking.shared;

  @override
  FutureOrError<LoginResponse> login(LoginRequest request) async {
    return await FutureUtil.callOrError(() async {
      final response = await _baseNetworking.post(
        partUrl: 'login',
        contentType: 'application/json',
        bodyParams: request.toJson(),
      );

      return LoginResponse.fromJson(response.data as Map<String, dynamic>);
    }, isLoginPage: true);
  }
}
