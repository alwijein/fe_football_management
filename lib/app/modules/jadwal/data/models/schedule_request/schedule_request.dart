import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_request.freezed.dart';
part 'schedule_request.g.dart';

@freezed
class ScheduleRequest with _$ScheduleRequest {
  const factory ScheduleRequest({
    @JsonKey(name: 'home_team_id') required int homeTeamId,
    @JsonKey(name: 'away_team_id') required int awayTeamId,
    @JsonKey(name: 'match_date') required String matchDate,
    @JsonKey(name: 'match_time') required String matchTime,
    required String location,
  }) = _ScheduleRequest;

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestFromJson(json);
}

@freezed
class UpdateResultRequest with _$UpdateResultRequest {
  const factory UpdateResultRequest({
    @JsonKey(name: 'home_score') required int homeScore,
    @JsonKey(name: 'away_score') required int awayScore,
    required String status,
  }) = _UpdateResultRequest;

  factory UpdateResultRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateResultRequestFromJson(json);
}
