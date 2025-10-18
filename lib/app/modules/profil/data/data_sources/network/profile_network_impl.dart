import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fe_football/app/data/models/common/base_response.dart';
import 'package:fe_football/app/modules/profil/data/models/profile/profile.dart';
import 'package:fe_football/app/modules/profil/data/models/profile_request/profile_request.dart';
import 'package:fe_football/app/modules/profil/data/data_sources/network/profile_network.dart';
import 'package:fe_football/utils/network/base_networking.dart';
import 'package:fe_football/utils/future/future_util.dart';

class ProfileNetworkImpl implements ProfileNetwork {
  final BaseNetworking _baseNetworking;

  ProfileNetworkImpl(this._baseNetworking);

  @override
  FutureOrError<BaseResponse<Profile>> getProfile() {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.get(partUrl: '/profile');

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Profile.fromJson(responseData['data'] as Map<String, dynamic>)
          : null;

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: data,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<Profile>> updateProfile({
    required String fullName,
    required String username,
    required String email,
    File? photoFile,
  }) {
    return FutureUtil.callOrError(() async {
      dynamic requestData;
      String contentType;

      if (photoFile != null) {
        // Use multipart/form-data if photo is provided
        final formData = FormData.fromMap({
          'full_name': fullName,
          'username': username,
          'email': email,
          'photo_url': await MultipartFile.fromFile(
            photoFile.path,
            filename: photoFile.path.split('/').last,
          ),
        });
        requestData = formData;
        contentType = 'multipart/form-data';
      } else {
        // Use application/json if no photo
        requestData = {
          'full_name': fullName,
          'username': username,
          'email': email,
        };
        contentType = 'application/json';
      }

      final response = await _baseNetworking.put(
        partUrl: '/profile',
        contentType: contentType,
        data: photoFile != null ? requestData : null,
        bodyParams: photoFile == null ? requestData : null,
      );

      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['data'] != null
          ? Profile.fromJson(responseData['data'] as Map<String, dynamic>)
          : null;

      return BaseResponse(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: data,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<void>> changePassword(
    ChangePasswordRequest request,
  ) {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.put(
        partUrl: '/profile/password',
        contentType: 'application/json',
        bodyParams: request.toJson(),
      );

      final responseData = response.data as Map<String, dynamic>;
      return BaseResponse<void>(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: null,
      );
    });
  }

  @override
  FutureOrError<BaseResponse<void>> logout() {
    return FutureUtil.callOrError(() async {
      final response = await _baseNetworking.post(partUrl: '/logout');

      final responseData = response.data as Map<String, dynamic>;
      return BaseResponse<void>(
        meta: ResponseMeta.fromJson(
          responseData['meta'] as Map<String, dynamic>,
        ),
        data: null,
      );
    });
  }
}
