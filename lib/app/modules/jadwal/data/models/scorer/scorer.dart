import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fe_football/app/modules/team/data/models/player/player.dart';

part 'scorer.freezed.dart';
part 'scorer.g.dart';

@freezed
class Scorer with _$Scorer {
  const factory Scorer({
    required int id,
    @JsonKey(name: 'match_id') required int matchId,
    required Player player,
    required int minute,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Scorer;

  factory Scorer.fromJson(Map<String, dynamic> json) => _$ScorerFromJson(json);
}
