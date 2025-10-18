// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayMatchImpl _$$TodayMatchImplFromJson(Map<String, dynamic> json) =>
    _$TodayMatchImpl(
      id: (json['id'] as num).toInt(),
      homeTeamId: (json['home_team_id'] as num).toInt(),
      awayTeamId: (json['away_team_id'] as num).toInt(),
      homeTeam: Team.fromJson(json['home_team'] as Map<String, dynamic>),
      awayTeam: Team.fromJson(json['away_team'] as Map<String, dynamic>),
      matchDate: json['match_date'] as String,
      matchTime: json['match_time'] as String,
      homeScore: (json['home_score'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$TodayMatchImplToJson(_$TodayMatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'home_team_id': instance.homeTeamId,
      'away_team_id': instance.awayTeamId,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'match_date': instance.matchDate,
      'match_time': instance.matchTime,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
