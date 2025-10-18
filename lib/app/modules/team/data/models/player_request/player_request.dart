import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_request.freezed.dart';
part 'player_request.g.dart';

@freezed
class PlayerRequest with _$PlayerRequest {
  const factory PlayerRequest({
    required String name,
    required int height,
    required int weight,
    required String position,
    @JsonKey(name: 'jersey_number') required int jerseyNumber,
  }) = _PlayerRequest;

  factory PlayerRequest.fromJson(Map<String, dynamic> json) =>
      _$PlayerRequestFromJson(json);
}
