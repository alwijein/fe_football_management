import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fe_football/app/modules/team/data/models/team/team.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required int id,
    @JsonKey(name: 'team_id') required int teamId,
    required String name,
    required int height,
    required int weight,
    required String position,
    @JsonKey(name: 'jersey_number') required int jerseyNumber,
    Team? team,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
