// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileRequestImpl _$$ProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProfileRequestImpl(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      photoUrl: json['photo_url'] as String?,
    );

Map<String, dynamic> _$$ProfileRequestImplToJson(
  _$ProfileRequestImpl instance,
) => <String, dynamic>{
  'full_name': instance.fullName,
  'email': instance.email,
  'username': instance.username,
  'photo_url': instance.photoUrl,
};

_$ChangePasswordRequestImpl _$$ChangePasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChangePasswordRequestImpl(
  oldPassword: json['old_password'] as String,
  newPassword: json['new_password'] as String,
  newPasswordConfirmation: json['new_password_confirmation'] as String,
);

Map<String, dynamic> _$$ChangePasswordRequestImplToJson(
  _$ChangePasswordRequestImpl instance,
) => <String, dynamic>{
  'old_password': instance.oldPassword,
  'new_password': instance.newPassword,
  'new_password_confirmation': instance.newPasswordConfirmation,
};
