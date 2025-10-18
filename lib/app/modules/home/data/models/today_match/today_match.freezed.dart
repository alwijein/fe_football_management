// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodayMatch _$TodayMatchFromJson(Map<String, dynamic> json) {
  return _TodayMatch.fromJson(json);
}

/// @nodoc
mixin _$TodayMatch {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_id')
  int get homeTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_id')
  int get awayTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team')
  Team get homeTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team')
  Team get awayTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_date')
  String get matchDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_time')
  String get matchTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_score')
  int? get homeScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_score')
  int? get awayScore => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TodayMatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayMatchCopyWith<TodayMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayMatchCopyWith<$Res> {
  factory $TodayMatchCopyWith(
    TodayMatch value,
    $Res Function(TodayMatch) then,
  ) = _$TodayMatchCopyWithImpl<$Res, TodayMatch>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'home_team_id') int homeTeamId,
    @JsonKey(name: 'away_team_id') int awayTeamId,
    @JsonKey(name: 'home_team') Team homeTeam,
    @JsonKey(name: 'away_team') Team awayTeam,
    @JsonKey(name: 'match_date') String matchDate,
    @JsonKey(name: 'match_time') String matchTime,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });

  $TeamCopyWith<$Res> get homeTeam;
  $TeamCopyWith<$Res> get awayTeam;
}

/// @nodoc
class _$TodayMatchCopyWithImpl<$Res, $Val extends TodayMatch>
    implements $TodayMatchCopyWith<$Res> {
  _$TodayMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeTeamId = null,
    Object? awayTeamId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? matchDate = null,
    Object? matchTime = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            homeTeamId: null == homeTeamId
                ? _value.homeTeamId
                : homeTeamId // ignore: cast_nullable_to_non_nullable
                      as int,
            awayTeamId: null == awayTeamId
                ? _value.awayTeamId
                : awayTeamId // ignore: cast_nullable_to_non_nullable
                      as int,
            homeTeam: null == homeTeam
                ? _value.homeTeam
                : homeTeam // ignore: cast_nullable_to_non_nullable
                      as Team,
            awayTeam: null == awayTeam
                ? _value.awayTeam
                : awayTeam // ignore: cast_nullable_to_non_nullable
                      as Team,
            matchDate: null == matchDate
                ? _value.matchDate
                : matchDate // ignore: cast_nullable_to_non_nullable
                      as String,
            matchTime: null == matchTime
                ? _value.matchTime
                : matchTime // ignore: cast_nullable_to_non_nullable
                      as String,
            homeScore: freezed == homeScore
                ? _value.homeScore
                : homeScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            awayScore: freezed == awayScore
                ? _value.awayScore
                : awayScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get homeTeam {
    return $TeamCopyWith<$Res>(_value.homeTeam, (value) {
      return _then(_value.copyWith(homeTeam: value) as $Val);
    });
  }

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get awayTeam {
    return $TeamCopyWith<$Res>(_value.awayTeam, (value) {
      return _then(_value.copyWith(awayTeam: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodayMatchImplCopyWith<$Res>
    implements $TodayMatchCopyWith<$Res> {
  factory _$$TodayMatchImplCopyWith(
    _$TodayMatchImpl value,
    $Res Function(_$TodayMatchImpl) then,
  ) = __$$TodayMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'home_team_id') int homeTeamId,
    @JsonKey(name: 'away_team_id') int awayTeamId,
    @JsonKey(name: 'home_team') Team homeTeam,
    @JsonKey(name: 'away_team') Team awayTeam,
    @JsonKey(name: 'match_date') String matchDate,
    @JsonKey(name: 'match_time') String matchTime,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    String status,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });

  @override
  $TeamCopyWith<$Res> get homeTeam;
  @override
  $TeamCopyWith<$Res> get awayTeam;
}

/// @nodoc
class __$$TodayMatchImplCopyWithImpl<$Res>
    extends _$TodayMatchCopyWithImpl<$Res, _$TodayMatchImpl>
    implements _$$TodayMatchImplCopyWith<$Res> {
  __$$TodayMatchImplCopyWithImpl(
    _$TodayMatchImpl _value,
    $Res Function(_$TodayMatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeTeamId = null,
    Object? awayTeamId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? matchDate = null,
    Object? matchTime = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$TodayMatchImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        homeTeamId: null == homeTeamId
            ? _value.homeTeamId
            : homeTeamId // ignore: cast_nullable_to_non_nullable
                  as int,
        awayTeamId: null == awayTeamId
            ? _value.awayTeamId
            : awayTeamId // ignore: cast_nullable_to_non_nullable
                  as int,
        homeTeam: null == homeTeam
            ? _value.homeTeam
            : homeTeam // ignore: cast_nullable_to_non_nullable
                  as Team,
        awayTeam: null == awayTeam
            ? _value.awayTeam
            : awayTeam // ignore: cast_nullable_to_non_nullable
                  as Team,
        matchDate: null == matchDate
            ? _value.matchDate
            : matchDate // ignore: cast_nullable_to_non_nullable
                  as String,
        matchTime: null == matchTime
            ? _value.matchTime
            : matchTime // ignore: cast_nullable_to_non_nullable
                  as String,
        homeScore: freezed == homeScore
            ? _value.homeScore
            : homeScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        awayScore: freezed == awayScore
            ? _value.awayScore
            : awayScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayMatchImpl implements _TodayMatch {
  const _$TodayMatchImpl({
    required this.id,
    @JsonKey(name: 'home_team_id') required this.homeTeamId,
    @JsonKey(name: 'away_team_id') required this.awayTeamId,
    @JsonKey(name: 'home_team') required this.homeTeam,
    @JsonKey(name: 'away_team') required this.awayTeam,
    @JsonKey(name: 'match_date') required this.matchDate,
    @JsonKey(name: 'match_time') required this.matchTime,
    @JsonKey(name: 'home_score') this.homeScore,
    @JsonKey(name: 'away_score') this.awayScore,
    required this.status,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$TodayMatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayMatchImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'home_team_id')
  final int homeTeamId;
  @override
  @JsonKey(name: 'away_team_id')
  final int awayTeamId;
  @override
  @JsonKey(name: 'home_team')
  final Team homeTeam;
  @override
  @JsonKey(name: 'away_team')
  final Team awayTeam;
  @override
  @JsonKey(name: 'match_date')
  final String matchDate;
  @override
  @JsonKey(name: 'match_time')
  final String matchTime;
  @override
  @JsonKey(name: 'home_score')
  final int? homeScore;
  @override
  @JsonKey(name: 'away_score')
  final int? awayScore;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'TodayMatch(id: $id, homeTeamId: $homeTeamId, awayTeamId: $awayTeamId, homeTeam: $homeTeam, awayTeam: $awayTeam, matchDate: $matchDate, matchTime: $matchTime, homeScore: $homeScore, awayScore: $awayScore, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayMatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeTeamId, homeTeamId) ||
                other.homeTeamId == homeTeamId) &&
            (identical(other.awayTeamId, awayTeamId) ||
                other.awayTeamId == awayTeamId) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.matchDate, matchDate) ||
                other.matchDate == matchDate) &&
            (identical(other.matchTime, matchTime) ||
                other.matchTime == matchTime) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    homeTeamId,
    awayTeamId,
    homeTeam,
    awayTeam,
    matchDate,
    matchTime,
    homeScore,
    awayScore,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayMatchImplCopyWith<_$TodayMatchImpl> get copyWith =>
      __$$TodayMatchImplCopyWithImpl<_$TodayMatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayMatchImplToJson(this);
  }
}

abstract class _TodayMatch implements TodayMatch {
  const factory _TodayMatch({
    required final int id,
    @JsonKey(name: 'home_team_id') required final int homeTeamId,
    @JsonKey(name: 'away_team_id') required final int awayTeamId,
    @JsonKey(name: 'home_team') required final Team homeTeam,
    @JsonKey(name: 'away_team') required final Team awayTeam,
    @JsonKey(name: 'match_date') required final String matchDate,
    @JsonKey(name: 'match_time') required final String matchTime,
    @JsonKey(name: 'home_score') final int? homeScore,
    @JsonKey(name: 'away_score') final int? awayScore,
    required final String status,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _$TodayMatchImpl;

  factory _TodayMatch.fromJson(Map<String, dynamic> json) =
      _$TodayMatchImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'home_team_id')
  int get homeTeamId;
  @override
  @JsonKey(name: 'away_team_id')
  int get awayTeamId;
  @override
  @JsonKey(name: 'home_team')
  Team get homeTeam;
  @override
  @JsonKey(name: 'away_team')
  Team get awayTeam;
  @override
  @JsonKey(name: 'match_date')
  String get matchDate;
  @override
  @JsonKey(name: 'match_time')
  String get matchTime;
  @override
  @JsonKey(name: 'home_score')
  int? get homeScore;
  @override
  @JsonKey(name: 'away_score')
  int? get awayScore;
  @override
  String get status;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of TodayMatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayMatchImplCopyWith<_$TodayMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
