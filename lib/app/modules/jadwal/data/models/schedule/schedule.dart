import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
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
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
