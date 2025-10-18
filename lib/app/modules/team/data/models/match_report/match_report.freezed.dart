// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MatchReport _$MatchReportFromJson(Map<String, dynamic> json) {
  return _MatchReport.fromJson(json);
}

/// @nodoc
mixin _$MatchReport {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_date')
  String get matchDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_time')
  String get matchTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team')
  Team get homeTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team')
  Team get awayTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_score')
  int? get homeScore => throw _privateConstructorUsedError; // Nullable karena bisa null dari API
  @JsonKey(name: 'away_score')
  int? get awayScore => throw _privateConstructorUsedError; // Nullable karena bisa null dari API
  @JsonKey(name: 'match_result')
  String get matchResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_scorer')
  TopScorer? get topScorer => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_total_wins')
  int get homeTeamTotalWins => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_total_wins')
  int get awayTeamTotalWins => throw _privateConstructorUsedError;
  List<Scorer>? get goals => throw _privateConstructorUsedError;

  /// Serializes this MatchReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchReportCopyWith<MatchReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchReportCopyWith<$Res> {
  factory $MatchReportCopyWith(
    MatchReport value,
    $Res Function(MatchReport) then,
  ) = _$MatchReportCopyWithImpl<$Res, MatchReport>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'match_date') String matchDate,
    @JsonKey(name: 'match_time') String matchTime,
    @JsonKey(name: 'home_team') Team homeTeam,
    @JsonKey(name: 'away_team') Team awayTeam,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    @JsonKey(name: 'match_result') String matchResult,
    @JsonKey(name: 'top_scorer') TopScorer? topScorer,
    @JsonKey(name: 'home_team_total_wins') int homeTeamTotalWins,
    @JsonKey(name: 'away_team_total_wins') int awayTeamTotalWins,
    List<Scorer>? goals,
  });

  $TeamCopyWith<$Res> get homeTeam;
  $TeamCopyWith<$Res> get awayTeam;
  $TopScorerCopyWith<$Res>? get topScorer;
}

/// @nodoc
class _$MatchReportCopyWithImpl<$Res, $Val extends MatchReport>
    implements $MatchReportCopyWith<$Res> {
  _$MatchReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchDate = null,
    Object? matchTime = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? matchResult = null,
    Object? topScorer = freezed,
    Object? homeTeamTotalWins = null,
    Object? awayTeamTotalWins = null,
    Object? goals = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            matchDate: null == matchDate
                ? _value.matchDate
                : matchDate // ignore: cast_nullable_to_non_nullable
                      as String,
            matchTime: null == matchTime
                ? _value.matchTime
                : matchTime // ignore: cast_nullable_to_non_nullable
                      as String,
            homeTeam: null == homeTeam
                ? _value.homeTeam
                : homeTeam // ignore: cast_nullable_to_non_nullable
                      as Team,
            awayTeam: null == awayTeam
                ? _value.awayTeam
                : awayTeam // ignore: cast_nullable_to_non_nullable
                      as Team,
            homeScore: freezed == homeScore
                ? _value.homeScore
                : homeScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            awayScore: freezed == awayScore
                ? _value.awayScore
                : awayScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            matchResult: null == matchResult
                ? _value.matchResult
                : matchResult // ignore: cast_nullable_to_non_nullable
                      as String,
            topScorer: freezed == topScorer
                ? _value.topScorer
                : topScorer // ignore: cast_nullable_to_non_nullable
                      as TopScorer?,
            homeTeamTotalWins: null == homeTeamTotalWins
                ? _value.homeTeamTotalWins
                : homeTeamTotalWins // ignore: cast_nullable_to_non_nullable
                      as int,
            awayTeamTotalWins: null == awayTeamTotalWins
                ? _value.awayTeamTotalWins
                : awayTeamTotalWins // ignore: cast_nullable_to_non_nullable
                      as int,
            goals: freezed == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<Scorer>?,
          )
          as $Val,
    );
  }

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get homeTeam {
    return $TeamCopyWith<$Res>(_value.homeTeam, (value) {
      return _then(_value.copyWith(homeTeam: value) as $Val);
    });
  }

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get awayTeam {
    return $TeamCopyWith<$Res>(_value.awayTeam, (value) {
      return _then(_value.copyWith(awayTeam: value) as $Val);
    });
  }

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TopScorerCopyWith<$Res>? get topScorer {
    if (_value.topScorer == null) {
      return null;
    }

    return $TopScorerCopyWith<$Res>(_value.topScorer!, (value) {
      return _then(_value.copyWith(topScorer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchReportImplCopyWith<$Res>
    implements $MatchReportCopyWith<$Res> {
  factory _$$MatchReportImplCopyWith(
    _$MatchReportImpl value,
    $Res Function(_$MatchReportImpl) then,
  ) = __$$MatchReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'match_date') String matchDate,
    @JsonKey(name: 'match_time') String matchTime,
    @JsonKey(name: 'home_team') Team homeTeam,
    @JsonKey(name: 'away_team') Team awayTeam,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    @JsonKey(name: 'match_result') String matchResult,
    @JsonKey(name: 'top_scorer') TopScorer? topScorer,
    @JsonKey(name: 'home_team_total_wins') int homeTeamTotalWins,
    @JsonKey(name: 'away_team_total_wins') int awayTeamTotalWins,
    List<Scorer>? goals,
  });

  @override
  $TeamCopyWith<$Res> get homeTeam;
  @override
  $TeamCopyWith<$Res> get awayTeam;
  @override
  $TopScorerCopyWith<$Res>? get topScorer;
}

/// @nodoc
class __$$MatchReportImplCopyWithImpl<$Res>
    extends _$MatchReportCopyWithImpl<$Res, _$MatchReportImpl>
    implements _$$MatchReportImplCopyWith<$Res> {
  __$$MatchReportImplCopyWithImpl(
    _$MatchReportImpl _value,
    $Res Function(_$MatchReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchDate = null,
    Object? matchTime = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? matchResult = null,
    Object? topScorer = freezed,
    Object? homeTeamTotalWins = null,
    Object? awayTeamTotalWins = null,
    Object? goals = freezed,
  }) {
    return _then(
      _$MatchReportImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        matchDate: null == matchDate
            ? _value.matchDate
            : matchDate // ignore: cast_nullable_to_non_nullable
                  as String,
        matchTime: null == matchTime
            ? _value.matchTime
            : matchTime // ignore: cast_nullable_to_non_nullable
                  as String,
        homeTeam: null == homeTeam
            ? _value.homeTeam
            : homeTeam // ignore: cast_nullable_to_non_nullable
                  as Team,
        awayTeam: null == awayTeam
            ? _value.awayTeam
            : awayTeam // ignore: cast_nullable_to_non_nullable
                  as Team,
        homeScore: freezed == homeScore
            ? _value.homeScore
            : homeScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        awayScore: freezed == awayScore
            ? _value.awayScore
            : awayScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        matchResult: null == matchResult
            ? _value.matchResult
            : matchResult // ignore: cast_nullable_to_non_nullable
                  as String,
        topScorer: freezed == topScorer
            ? _value.topScorer
            : topScorer // ignore: cast_nullable_to_non_nullable
                  as TopScorer?,
        homeTeamTotalWins: null == homeTeamTotalWins
            ? _value.homeTeamTotalWins
            : homeTeamTotalWins // ignore: cast_nullable_to_non_nullable
                  as int,
        awayTeamTotalWins: null == awayTeamTotalWins
            ? _value.awayTeamTotalWins
            : awayTeamTotalWins // ignore: cast_nullable_to_non_nullable
                  as int,
        goals: freezed == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<Scorer>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchReportImpl implements _MatchReport {
  const _$MatchReportImpl({
    required this.id,
    @JsonKey(name: 'match_date') required this.matchDate,
    @JsonKey(name: 'match_time') required this.matchTime,
    @JsonKey(name: 'home_team') required this.homeTeam,
    @JsonKey(name: 'away_team') required this.awayTeam,
    @JsonKey(name: 'home_score') this.homeScore,
    @JsonKey(name: 'away_score') this.awayScore,
    @JsonKey(name: 'match_result') required this.matchResult,
    @JsonKey(name: 'top_scorer') this.topScorer,
    @JsonKey(name: 'home_team_total_wins') required this.homeTeamTotalWins,
    @JsonKey(name: 'away_team_total_wins') required this.awayTeamTotalWins,
    final List<Scorer>? goals,
  }) : _goals = goals;

  factory _$MatchReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchReportImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'match_date')
  final String matchDate;
  @override
  @JsonKey(name: 'match_time')
  final String matchTime;
  @override
  @JsonKey(name: 'home_team')
  final Team homeTeam;
  @override
  @JsonKey(name: 'away_team')
  final Team awayTeam;
  @override
  @JsonKey(name: 'home_score')
  final int? homeScore;
  // Nullable karena bisa null dari API
  @override
  @JsonKey(name: 'away_score')
  final int? awayScore;
  // Nullable karena bisa null dari API
  @override
  @JsonKey(name: 'match_result')
  final String matchResult;
  @override
  @JsonKey(name: 'top_scorer')
  final TopScorer? topScorer;
  @override
  @JsonKey(name: 'home_team_total_wins')
  final int homeTeamTotalWins;
  @override
  @JsonKey(name: 'away_team_total_wins')
  final int awayTeamTotalWins;
  final List<Scorer>? _goals;
  @override
  List<Scorer>? get goals {
    final value = _goals;
    if (value == null) return null;
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MatchReport(id: $id, matchDate: $matchDate, matchTime: $matchTime, homeTeam: $homeTeam, awayTeam: $awayTeam, homeScore: $homeScore, awayScore: $awayScore, matchResult: $matchResult, topScorer: $topScorer, homeTeamTotalWins: $homeTeamTotalWins, awayTeamTotalWins: $awayTeamTotalWins, goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchDate, matchDate) ||
                other.matchDate == matchDate) &&
            (identical(other.matchTime, matchTime) ||
                other.matchTime == matchTime) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.matchResult, matchResult) ||
                other.matchResult == matchResult) &&
            (identical(other.topScorer, topScorer) ||
                other.topScorer == topScorer) &&
            (identical(other.homeTeamTotalWins, homeTeamTotalWins) ||
                other.homeTeamTotalWins == homeTeamTotalWins) &&
            (identical(other.awayTeamTotalWins, awayTeamTotalWins) ||
                other.awayTeamTotalWins == awayTeamTotalWins) &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    matchDate,
    matchTime,
    homeTeam,
    awayTeam,
    homeScore,
    awayScore,
    matchResult,
    topScorer,
    homeTeamTotalWins,
    awayTeamTotalWins,
    const DeepCollectionEquality().hash(_goals),
  );

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchReportImplCopyWith<_$MatchReportImpl> get copyWith =>
      __$$MatchReportImplCopyWithImpl<_$MatchReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchReportImplToJson(this);
  }
}

abstract class _MatchReport implements MatchReport {
  const factory _MatchReport({
    required final int id,
    @JsonKey(name: 'match_date') required final String matchDate,
    @JsonKey(name: 'match_time') required final String matchTime,
    @JsonKey(name: 'home_team') required final Team homeTeam,
    @JsonKey(name: 'away_team') required final Team awayTeam,
    @JsonKey(name: 'home_score') final int? homeScore,
    @JsonKey(name: 'away_score') final int? awayScore,
    @JsonKey(name: 'match_result') required final String matchResult,
    @JsonKey(name: 'top_scorer') final TopScorer? topScorer,
    @JsonKey(name: 'home_team_total_wins') required final int homeTeamTotalWins,
    @JsonKey(name: 'away_team_total_wins') required final int awayTeamTotalWins,
    final List<Scorer>? goals,
  }) = _$MatchReportImpl;

  factory _MatchReport.fromJson(Map<String, dynamic> json) =
      _$MatchReportImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'match_date')
  String get matchDate;
  @override
  @JsonKey(name: 'match_time')
  String get matchTime;
  @override
  @JsonKey(name: 'home_team')
  Team get homeTeam;
  @override
  @JsonKey(name: 'away_team')
  Team get awayTeam;
  @override
  @JsonKey(name: 'home_score')
  int? get homeScore; // Nullable karena bisa null dari API
  @override
  @JsonKey(name: 'away_score')
  int? get awayScore; // Nullable karena bisa null dari API
  @override
  @JsonKey(name: 'match_result')
  String get matchResult;
  @override
  @JsonKey(name: 'top_scorer')
  TopScorer? get topScorer;
  @override
  @JsonKey(name: 'home_team_total_wins')
  int get homeTeamTotalWins;
  @override
  @JsonKey(name: 'away_team_total_wins')
  int get awayTeamTotalWins;
  @override
  List<Scorer>? get goals;

  /// Create a copy of MatchReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchReportImplCopyWith<_$MatchReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopScorer _$TopScorerFromJson(Map<String, dynamic> json) {
  return _TopScorer.fromJson(json);
}

/// @nodoc
mixin _$TopScorer {
  @JsonKey(name: 'player_id')
  int get playerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String get playerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_name')
  String get teamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_count')
  int get goalCount => throw _privateConstructorUsedError;

  /// Serializes this TopScorer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopScorer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopScorerCopyWith<TopScorer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopScorerCopyWith<$Res> {
  factory $TopScorerCopyWith(TopScorer value, $Res Function(TopScorer) then) =
      _$TopScorerCopyWithImpl<$Res, TopScorer>;
  @useResult
  $Res call({
    @JsonKey(name: 'player_id') int playerId,
    @JsonKey(name: 'player_name') String playerName,
    @JsonKey(name: 'team_name') String teamName,
    @JsonKey(name: 'goal_count') int goalCount,
  });
}

/// @nodoc
class _$TopScorerCopyWithImpl<$Res, $Val extends TopScorer>
    implements $TopScorerCopyWith<$Res> {
  _$TopScorerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopScorer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = null,
    Object? teamName = null,
    Object? goalCount = null,
  }) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as int,
            playerName: null == playerName
                ? _value.playerName
                : playerName // ignore: cast_nullable_to_non_nullable
                      as String,
            teamName: null == teamName
                ? _value.teamName
                : teamName // ignore: cast_nullable_to_non_nullable
                      as String,
            goalCount: null == goalCount
                ? _value.goalCount
                : goalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopScorerImplCopyWith<$Res>
    implements $TopScorerCopyWith<$Res> {
  factory _$$TopScorerImplCopyWith(
    _$TopScorerImpl value,
    $Res Function(_$TopScorerImpl) then,
  ) = __$$TopScorerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'player_id') int playerId,
    @JsonKey(name: 'player_name') String playerName,
    @JsonKey(name: 'team_name') String teamName,
    @JsonKey(name: 'goal_count') int goalCount,
  });
}

/// @nodoc
class __$$TopScorerImplCopyWithImpl<$Res>
    extends _$TopScorerCopyWithImpl<$Res, _$TopScorerImpl>
    implements _$$TopScorerImplCopyWith<$Res> {
  __$$TopScorerImplCopyWithImpl(
    _$TopScorerImpl _value,
    $Res Function(_$TopScorerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopScorer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = null,
    Object? teamName = null,
    Object? goalCount = null,
  }) {
    return _then(
      _$TopScorerImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as int,
        playerName: null == playerName
            ? _value.playerName
            : playerName // ignore: cast_nullable_to_non_nullable
                  as String,
        teamName: null == teamName
            ? _value.teamName
            : teamName // ignore: cast_nullable_to_non_nullable
                  as String,
        goalCount: null == goalCount
            ? _value.goalCount
            : goalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopScorerImpl implements _TopScorer {
  const _$TopScorerImpl({
    @JsonKey(name: 'player_id') required this.playerId,
    @JsonKey(name: 'player_name') required this.playerName,
    @JsonKey(name: 'team_name') required this.teamName,
    @JsonKey(name: 'goal_count') required this.goalCount,
  });

  factory _$TopScorerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopScorerImplFromJson(json);

  @override
  @JsonKey(name: 'player_id')
  final int playerId;
  @override
  @JsonKey(name: 'player_name')
  final String playerName;
  @override
  @JsonKey(name: 'team_name')
  final String teamName;
  @override
  @JsonKey(name: 'goal_count')
  final int goalCount;

  @override
  String toString() {
    return 'TopScorer(playerId: $playerId, playerName: $playerName, teamName: $teamName, goalCount: $goalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopScorerImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.goalCount, goalCount) ||
                other.goalCount == goalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, playerId, playerName, teamName, goalCount);

  /// Create a copy of TopScorer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopScorerImplCopyWith<_$TopScorerImpl> get copyWith =>
      __$$TopScorerImplCopyWithImpl<_$TopScorerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopScorerImplToJson(this);
  }
}

abstract class _TopScorer implements TopScorer {
  const factory _TopScorer({
    @JsonKey(name: 'player_id') required final int playerId,
    @JsonKey(name: 'player_name') required final String playerName,
    @JsonKey(name: 'team_name') required final String teamName,
    @JsonKey(name: 'goal_count') required final int goalCount,
  }) = _$TopScorerImpl;

  factory _TopScorer.fromJson(Map<String, dynamic> json) =
      _$TopScorerImpl.fromJson;

  @override
  @JsonKey(name: 'player_id')
  int get playerId;
  @override
  @JsonKey(name: 'player_name')
  String get playerName;
  @override
  @JsonKey(name: 'team_name')
  String get teamName;
  @override
  @JsonKey(name: 'goal_count')
  int get goalCount;

  /// Create a copy of TopScorer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopScorerImplCopyWith<_$TopScorerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
