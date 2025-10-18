import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/profil/data/models/profile/profile.dart';
import 'package:fe_football/app/modules/profil/data/models/profile_request/profile_request.dart';
import 'package:fe_football/utils/future/future_util.dart';

abstract class ProfileRepository {
  FutureOrError<BaseResponse<Profile>> getProfile();
  FutureOrError<BaseResponse<Profile>> updateProfile(ProfileRequest request);
  FutureOrError<BaseResponse<void>> changePassword(
    ChangePasswordRequest request,
  );
  FutureOrError<BaseResponse<void>> logout();
}
