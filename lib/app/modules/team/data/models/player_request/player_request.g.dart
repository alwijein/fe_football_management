// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerRequestImpl _$$PlayerRequestImplFromJson(Map<String, dynamic> json) =>
    _$PlayerRequestImpl(
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      position: json['position'] as String,
      jerseyNumber: (json['jersey_number'] as num).toInt(),
    );

Map<String, dynamic> _$$PlayerRequestImplToJson(_$PlayerRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'position': instance.position,
      'jersey_number': instance.jerseyNumber,
    };
