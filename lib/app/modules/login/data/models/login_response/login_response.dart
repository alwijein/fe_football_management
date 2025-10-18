import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required LoginMeta meta,
    required LoginData data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginMeta with _$LoginMeta {
  const factory LoginMeta({
    required int code,
    required String status,
    required String message,
  }) = _LoginMeta;

  factory LoginMeta.fromJson(Map<String, dynamic> json) =>
      _$LoginMetaFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({required String token, required LoginUser user}) =
      _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class LoginUser with _$LoginUser {
  const factory LoginUser({
    required int id,
    required String username,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'photo_url') required String photoUrl,
  }) = _LoginUser;

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
}
