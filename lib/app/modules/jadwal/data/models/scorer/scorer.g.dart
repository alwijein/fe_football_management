// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scorer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScorerImpl _$$ScorerImplFromJson(Map<String, dynamic> json) => _$ScorerImpl(
  id: (json['id'] as num).toInt(),
  matchId: (json['match_id'] as num).toInt(),
  player: Player.fromJson(json['player'] as Map<String, dynamic>),
  minute: (json['minute'] as num).toInt(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$ScorerImplToJson(_$ScorerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_id': instance.matchId,
      'player': instance.player,
      'minute': instance.minute,
      'created_at': instance.createdAt,
    };
