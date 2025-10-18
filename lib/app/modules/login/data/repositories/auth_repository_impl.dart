import 'package:fe_football/app/modules/login/data/data_sources/network/auth_network.dart';
import 'package:fe_football/app/modules/login/data/models/login_request/login_request.dart';
import 'package:fe_football/app/modules/login/data/models/login_response/login_response.dart';
import 'package:fe_football/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:fe_football/utils/future/future_util.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthNetwork _authNetwork;

  AuthRepositoryImpl(this._authNetwork);

  @override
  FutureOrError<LoginResponse> login(LoginRequest request) async {
    return await _authNetwork.login(request);
  }
}
