// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScheduleRequest _$ScheduleRequestFromJson(Map<String, dynamic> json) {
  return _ScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$ScheduleRequest {
  @JsonKey(name: 'home_team_id')
  int get homeTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_id')
  int get awayTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_date')
  String get matchDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_time')
  String get matchTime => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// Serializes this ScheduleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleRequestCopyWith<ScheduleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleRequestCopyWith<$Res> {
  factory $ScheduleRequestCopyWith(
    ScheduleRequest value,
    $Res Function(ScheduleRequest) then,
  ) = _$ScheduleRequestCopyWithImpl<$Res, ScheduleRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'home_team_id') int homeTeamId,
    @JsonKey(name: 'away_team_id') int awayTeamId,
    @JsonKey(name: 'match_date') String matchDate,
    @JsonKey(name: 'match_time') String matchTime,
    String location,
  });
}

/// @nodoc
class _$ScheduleRequestCopyWithImpl<$Res, $Val extends ScheduleRequest>
    implements $ScheduleRequestCopyWith<$Res> {
  _$ScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeTeamId = null,
    Object? awayTeamId = null,
    Object? matchDate = null,
    Object? matchTime = null,
    Object? location = null,
  }) {
    return _then(
      _value.copyWith(
            homeTeamId: null == homeTeamId
                ? _value.homeTeamId
                : homeTeamId // ignore: cast_nullable_to_non_nullable
                      as int,
            awayTeamId: null == awayTeamId
                ? _value.awayTeamId
                : awayTeamId // ignore: cast_nullable_to_non_nullable
                      as int,
            matchDate: null == matchDate
                ? _value.matchDate
                : matchDate // ignore: cast_nullable_to_non_nullable
                      as String,
            matchTime: null == matchTime
                ? _value.matchTime
                : matchTime // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScheduleRequestImplCopyWith<$Res>
    implements $ScheduleRequestCopyWith<$Res> {
  factory _$$ScheduleRequestImplCopyWith(
    _$ScheduleRequestImpl value,
    $Res Function(_$ScheduleRequestImpl) then,
  ) = __$$ScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'home_team_id') int homeTeamId,
    @JsonKey(name: 'away_team_id') int awayTeamId,
    @JsonKey(name: 'match_date') String matchDate,
    @JsonKey(name: 'match_time') String matchTime,
    String location,
  });
}

/// @nodoc
class __$$ScheduleRequestImplCopyWithImpl<$Res>
    extends _$ScheduleRequestCopyWithImpl<$Res, _$ScheduleRequestImpl>
    implements _$$ScheduleRequestImplCopyWith<$Res> {
  __$$ScheduleRequestImplCopyWithImpl(
    _$ScheduleRequestImpl _value,
    $Res Function(_$ScheduleRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeTeamId = null,
    Object? awayTeamId = null,
    Object? matchDate = null,
    Object? matchTime = null,
    Object? location = null,
  }) {
    return _then(
      _$ScheduleRequestImpl(
        homeTeamId: null == homeTeamId
            ? _value.homeTeamId
            : homeTeamId // ignore: cast_nullable_to_non_nullable
                  as int,
        awayTeamId: null == awayTeamId
            ? _value.awayTeamId
            : awayTeamId // ignore: cast_nullable_to_non_nullable
                  as int,
        matchDate: null == matchDate
            ? _value.matchDate
            : matchDate // ignore: cast_nullable_to_non_nullable
                  as String,
        matchTime: null == matchTime
            ? _value.matchTime
            : matchTime // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleRequestImpl implements _ScheduleRequest {
  const _$ScheduleRequestImpl({
    @JsonKey(name: 'home_team_id') required this.homeTeamId,
    @JsonKey(name: 'away_team_id') required this.awayTeamId,
    @JsonKey(name: 'match_date') required this.matchDate,
    @JsonKey(name: 'match_time') required this.matchTime,
    required this.location,
  });

  factory _$ScheduleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleRequestImplFromJson(json);

  @override
  @JsonKey(name: 'home_team_id')
  final int homeTeamId;
  @override
  @JsonKey(name: 'away_team_id')
  final int awayTeamId;
  @override
  @JsonKey(name: 'match_date')
  final String matchDate;
  @override
  @JsonKey(name: 'match_time')
  final String matchTime;
  @override
  final String location;

  @override
  String toString() {
    return 'ScheduleRequest(homeTeamId: $homeTeamId, awayTeamId: $awayTeamId, matchDate: $matchDate, matchTime: $matchTime, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleRequestImpl &&
            (identical(other.homeTeamId, homeTeamId) ||
                other.homeTeamId == homeTeamId) &&
            (identical(other.awayTeamId, awayTeamId) ||
                other.awayTeamId == awayTeamId) &&
            (identical(other.matchDate, matchDate) ||
                other.matchDate == matchDate) &&
            (identical(other.matchTime, matchTime) ||
                other.matchTime == matchTime) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    homeTeamId,
    awayTeamId,
    matchDate,
    matchTime,
    location,
  );

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleRequestImplCopyWith<_$ScheduleRequestImpl> get copyWith =>
      __$$ScheduleRequestImplCopyWithImpl<_$ScheduleRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleRequestImplToJson(this);
  }
}

abstract class _ScheduleRequest implements ScheduleRequest {
  const factory _ScheduleRequest({
    @JsonKey(name: 'home_team_id') required final int homeTeamId,
    @JsonKey(name: 'away_team_id') required final int awayTeamId,
    @JsonKey(name: 'match_date') required final String matchDate,
    @JsonKey(name: 'match_time') required final String matchTime,
    required final String location,
  }) = _$ScheduleRequestImpl;

  factory _ScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$ScheduleRequestImpl.fromJson;

  @override
  @JsonKey(name: 'home_team_id')
  int get homeTeamId;
  @override
  @JsonKey(name: 'away_team_id')
  int get awayTeamId;
  @override
  @JsonKey(name: 'match_date')
  String get matchDate;
  @override
  @JsonKey(name: 'match_time')
  String get matchTime;
  @override
  String get location;

  /// Create a copy of ScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleRequestImplCopyWith<_$ScheduleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateResultRequest _$UpdateResultRequestFromJson(Map<String, dynamic> json) {
  return _UpdateResultRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateResultRequest {
  @JsonKey(name: 'home_score')
  int get homeScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_score')
  int get awayScore => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateResultRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateResultRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateResultRequestCopyWith<UpdateResultRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateResultRequestCopyWith<$Res> {
  factory $UpdateResultRequestCopyWith(
    UpdateResultRequest value,
    $Res Function(UpdateResultRequest) then,
  ) = _$UpdateResultRequestCopyWithImpl<$Res, UpdateResultRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'home_score') int homeScore,
    @JsonKey(name: 'away_score') int awayScore,
    String status,
  });
}

/// @nodoc
class _$UpdateResultRequestCopyWithImpl<$Res, $Val extends UpdateResultRequest>
    implements $UpdateResultRequestCopyWith<$Res> {
  _$UpdateResultRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateResultRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeScore = null,
    Object? awayScore = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            homeScore: null == homeScore
                ? _value.homeScore
                : homeScore // ignore: cast_nullable_to_non_nullable
                      as int,
            awayScore: null == awayScore
                ? _value.awayScore
                : awayScore // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateResultRequestImplCopyWith<$Res>
    implements $UpdateResultRequestCopyWith<$Res> {
  factory _$$UpdateResultRequestImplCopyWith(
    _$UpdateResultRequestImpl value,
    $Res Function(_$UpdateResultRequestImpl) then,
  ) = __$$UpdateResultRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'home_score') int homeScore,
    @JsonKey(name: 'away_score') int awayScore,
    String status,
  });
}

/// @nodoc
class __$$UpdateResultRequestImplCopyWithImpl<$Res>
    extends _$UpdateResultRequestCopyWithImpl<$Res, _$UpdateResultRequestImpl>
    implements _$$UpdateResultRequestImplCopyWith<$Res> {
  __$$UpdateResultRequestImplCopyWithImpl(
    _$UpdateResultRequestImpl _value,
    $Res Function(_$UpdateResultRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateResultRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeScore = null,
    Object? awayScore = null,
    Object? status = null,
  }) {
    return _then(
      _$UpdateResultRequestImpl(
        homeScore: null == homeScore
            ? _value.homeScore
            : homeScore // ignore: cast_nullable_to_non_nullable
                  as int,
        awayScore: null == awayScore
            ? _value.awayScore
            : awayScore // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateResultRequestImpl implements _UpdateResultRequest {
  const _$UpdateResultRequestImpl({
    @JsonKey(name: 'home_score') required this.homeScore,
    @JsonKey(name: 'away_score') required this.awayScore,
    required this.status,
  });

  factory _$UpdateResultRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateResultRequestImplFromJson(json);

  @override
  @JsonKey(name: 'home_score')
  final int homeScore;
  @override
  @JsonKey(name: 'away_score')
  final int awayScore;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateResultRequest(homeScore: $homeScore, awayScore: $awayScore, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateResultRequestImpl &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, homeScore, awayScore, status);

  /// Create a copy of UpdateResultRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateResultRequestImplCopyWith<_$UpdateResultRequestImpl> get copyWith =>
      __$$UpdateResultRequestImplCopyWithImpl<_$UpdateResultRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateResultRequestImplToJson(this);
  }
}

abstract class _UpdateResultRequest implements UpdateResultRequest {
  const factory _UpdateResultRequest({
    @JsonKey(name: 'home_score') required final int homeScore,
    @JsonKey(name: 'away_score') required final int awayScore,
    required final String status,
  }) = _$UpdateResultRequestImpl;

  factory _UpdateResultRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateResultRequestImpl.fromJson;

  @override
  @JsonKey(name: 'home_score')
  int get homeScore;
  @override
  @JsonKey(name: 'away_score')
  int get awayScore;
  @override
  String get status;

  /// Create a copy of UpdateResultRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateResultRequestImplCopyWith<_$UpdateResultRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
