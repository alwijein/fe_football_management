// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scorer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScorerRequestImpl _$$ScorerRequestImplFromJson(Map<String, dynamic> json) =>
    _$ScorerRequestImpl(
      playerId: (json['player_id'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
    );

Map<String, dynamic> _$$ScorerRequestImplToJson(_$ScorerRequestImpl instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'minute': instance.minute,
    };
