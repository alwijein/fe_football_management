// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleRequestImpl _$$ScheduleRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ScheduleRequestImpl(
  homeTeamId: (json['home_team_id'] as num).toInt(),
  awayTeamId: (json['away_team_id'] as num).toInt(),
  matchDate: json['match_date'] as String,
  matchTime: json['match_time'] as String,
  location: json['location'] as String,
);

Map<String, dynamic> _$$ScheduleRequestImplToJson(
  _$ScheduleRequestImpl instance,
) => <String, dynamic>{
  'home_team_id': instance.homeTeamId,
  'away_team_id': instance.awayTeamId,
  'match_date': instance.matchDate,
  'match_time': instance.matchTime,
  'location': instance.location,
};

_$UpdateResultRequestImpl _$$UpdateResultRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateResultRequestImpl(
  homeScore: (json['home_score'] as num).toInt(),
  awayScore: (json['away_score'] as num).toInt(),
  status: json['status'] as String,
);

Map<String, dynamic> _$$UpdateResultRequestImplToJson(
  _$UpdateResultRequestImpl instance,
) => <String, dynamic>{
  'home_score': instance.homeScore,
  'away_score': instance.awayScore,
  'status': instance.status,
};
