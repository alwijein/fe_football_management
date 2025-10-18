import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';

part 'today_match.freezed.dart';
part 'today_match.g.dart';

@freezed
class TodayMatch with _$TodayMatch {
  const factory TodayMatch({
    required int id,
    @JsonKey(name: 'home_team_id') required int homeTeamId,
    @JsonKey(name: 'away_team_id') required int awayTeamId,
    @JsonKey(name: 'home_team') required Team homeTeam,
    @JsonKey(name: 'away_team') required Team awayTeam,
    @JsonKey(name: 'match_date') required String matchDate,
    @JsonKey(name: 'match_time') required String matchTime,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _TodayMatch;

  factory TodayMatch.fromJson(Map<String, dynamic> json) =>
      _$TodayMatchFromJson(json);
}
