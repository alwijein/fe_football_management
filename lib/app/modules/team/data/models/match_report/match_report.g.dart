// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchReportImpl _$$MatchReportImplFromJson(Map<String, dynamic> json) =>
    _$MatchReportImpl(
      id: (json['id'] as num).toInt(),
      matchDate: json['match_date'] as String,
      matchTime: json['match_time'] as String,
      homeTeam: Team.fromJson(json['home_team'] as Map<String, dynamic>),
      awayTeam: Team.fromJson(json['away_team'] as Map<String, dynamic>),
      homeScore: (json['home_score'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      matchResult: json['match_result'] as String,
      topScorer: json['top_scorer'] == null
          ? null
          : TopScorer.fromJson(json['top_scorer'] as Map<String, dynamic>),
      homeTeamTotalWins: (json['home_team_total_wins'] as num).toInt(),
      awayTeamTotalWins: (json['away_team_total_wins'] as num).toInt(),
      goals: (json['goals'] as List<dynamic>?)
          ?.map((e) => Scorer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchReportImplToJson(_$MatchReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_date': instance.matchDate,
      'match_time': instance.matchTime,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'match_result': instance.matchResult,
      'top_scorer': instance.topScorer,
      'home_team_total_wins': instance.homeTeamTotalWins,
      'away_team_total_wins': instance.awayTeamTotalWins,
      'goals': instance.goals,
    };

_$TopScorerImpl _$$TopScorerImplFromJson(Map<String, dynamic> json) =>
    _$TopScorerImpl(
      playerId: (json['player_id'] as num).toInt(),
      playerName: json['player_name'] as String,
      teamName: json['team_name'] as String,
      goalCount: (json['goal_count'] as num).toInt(),
    );

Map<String, dynamic> _$$TopScorerImplToJson(_$TopScorerImpl instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'player_name': instance.playerName,
      'team_name': instance.teamName,
      'goal_count': instance.goalCount,
    };
