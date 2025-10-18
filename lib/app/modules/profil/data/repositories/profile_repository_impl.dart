import 'dart:io';
import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/profil/data/models/profile/profile.dart';
import 'package:fe_football/app/modules/profil/data/models/profile_request/profile_request.dart';
import 'package:fe_football/app/modules/profil/data/data_sources/network/profile_network.dart';
import 'package:fe_football/app/modules/profil/domain/repositories/profile_repository.dart';
import 'package:fe_football/utils/future/future_util.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileNetwork _profileNetwork;

  ProfileRepositoryImpl(this._profileNetwork);

  @override
  FutureOrError<BaseResponse<Profile>> getProfile() {
    return _profileNetwork.getProfile();
  }

  @override
  FutureOrError<BaseResponse<Profile>> updateProfile({
    required String fullName,
    required String username,
    required String email,
    File? photoFile,
  }) {
    return _profileNetwork.updateProfile(
      fullName: fullName,
      username: username,
      email: email,
      photoFile: photoFile,
    );
  }

  @override
  FutureOrError<BaseResponse<void>> changePassword(
    ChangePasswordRequest request,
  ) {
    return _profileNetwork.changePassword(request);
  }

  @override
  FutureOrError<BaseResponse<void>> logout() {
    return _profileNetwork.logout();
  }
}
