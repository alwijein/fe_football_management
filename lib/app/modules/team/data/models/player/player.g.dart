// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
  id: (json['id'] as num).toInt(),
  teamId: (json['team_id'] as num).toInt(),
  name: json['name'] as String,
  height: (json['height'] as num).toInt(),
  weight: (json['weight'] as num).toInt(),
  position: json['position'] as String,
  jerseyNumber: (json['jersey_number'] as num).toInt(),
  team: json['team'] == null
      ? null
      : Team.fromJson(json['team'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team_id': instance.teamId,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'position': instance.position,
      'jersey_number': instance.jerseyNumber,
      'team': instance.team,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
