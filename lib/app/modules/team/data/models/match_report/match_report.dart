import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';
import 'package:fe_football/app/modules/jadwal/data/models/scorer/scorer.dart';

part 'match_report.freezed.dart';
part 'match_report.g.dart';

@freezed
class MatchReport with _$MatchReport {
  const factory MatchReport({
    required int id,
    @JsonKey(name: 'match_date') required String matchDate,
    @JsonKey(name: 'match_time') required String matchTime,
    @JsonKey(name: 'home_team') required Team homeTeam,
    @JsonKey(name: 'away_team') required Team awayTeam,
    @JsonKey(name: 'home_score')
    int? homeScore, // Nullable karena bisa null dari API
    @JsonKey(name: 'away_score')
    int? awayScore, // Nullable karena bisa null dari API
    @JsonKey(name: 'match_result') required String matchResult,
    @JsonKey(name: 'top_scorer') TopScorer? topScorer,
    @JsonKey(name: 'home_team_total_wins') required int homeTeamTotalWins,
    @JsonKey(name: 'away_team_total_wins') required int awayTeamTotalWins,
    List<Scorer>? goals,
  }) = _MatchReport;

  factory MatchReport.fromJson(Map<String, dynamic> json) =>
      _$MatchReportFromJson(json);
}

@freezed
class TopScorer with _$TopScorer {
  const factory TopScorer({
    @JsonKey(name: 'player_id') required int playerId,
    @JsonKey(name: 'player_name') required String playerName,
    @JsonKey(name: 'team_name') required String teamName,
    @JsonKey(name: 'goal_count') required int goalCount,
  }) = _TopScorer;

  factory TopScorer.fromJson(Map<String, dynamic> json) =>
      _$TopScorerFromJson(json);
}
