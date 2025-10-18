// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamImpl _$$TeamImplFromJson(Map<String, dynamic> json) => _$TeamImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  logo: json['logo'] as String,
  establishedYear: (json['established_year'] as num).toInt(),
  address: json['address'] as String,
  city: json['city'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$TeamImplToJson(_$TeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'established_year': instance.establishedYear,
      'address': instance.address,
      'city': instance.city,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
