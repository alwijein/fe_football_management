import 'package:freezed_annotation/freezed_annotation.dart';

part 'scorer_request.freezed.dart';
part 'scorer_request.g.dart';

@freezed
class ScorerRequest with _$ScorerRequest {
  const factory ScorerRequest({
    @JsonKey(name: 'player_id') required int playerId,
    required int minute,
  }) = _ScorerRequest;

  factory ScorerRequest.fromJson(Map<String, dynamic> json) =>
      _$ScorerRequestFromJson(json);
}
