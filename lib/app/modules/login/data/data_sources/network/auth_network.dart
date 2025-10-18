import 'package:fe_football/app/modules/login/data/models/login_request/login_request.dart';
import 'package:fe_football/app/modules/login/data/models/login_response/login_response.dart';
import 'package:fe_football/utils/future/future_util.dart';

abstract class AuthNetwork {
  FutureOrError<LoginResponse> login(LoginRequest request);
}
