// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scorer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Scorer _$ScorerFromJson(Map<String, dynamic> json) {
  return _Scorer.fromJson(json);
}

/// @nodoc
mixin _$Scorer {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_id')
  int get matchId => throw _privateConstructorUsedError;
  Player get player => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Scorer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Scorer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScorerCopyWith<Scorer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScorerCopyWith<$Res> {
  factory $ScorerCopyWith(Scorer value, $Res Function(Scorer) then) =
      _$ScorerCopyWithImpl<$Res, Scorer>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'match_id') int matchId,
    Player player,
    int minute,
    @JsonKey(name: 'created_at') String createdAt,
  });

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class _$ScorerCopyWithImpl<$Res, $Val extends Scorer>
    implements $ScorerCopyWith<$Res> {
  _$ScorerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Scorer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? player = null,
    Object? minute = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            matchId: null == matchId
                ? _value.matchId
                : matchId // ignore: cast_nullable_to_non_nullable
                      as int,
            player: null == player
                ? _value.player
                : player // ignore: cast_nullable_to_non_nullable
                      as Player,
            minute: null == minute
                ? _value.minute
                : minute // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of Scorer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player {
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScorerImplCopyWith<$Res> implements $ScorerCopyWith<$Res> {
  factory _$$ScorerImplCopyWith(
    _$ScorerImpl value,
    $Res Function(_$ScorerImpl) then,
  ) = __$$ScorerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'match_id') int matchId,
    Player player,
    int minute,
    @JsonKey(name: 'created_at') String createdAt,
  });

  @override
  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$$ScorerImplCopyWithImpl<$Res>
    extends _$ScorerCopyWithImpl<$Res, _$ScorerImpl>
    implements _$$ScorerImplCopyWith<$Res> {
  __$$ScorerImplCopyWithImpl(
    _$ScorerImpl _value,
    $Res Function(_$ScorerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Scorer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? player = null,
    Object? minute = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ScorerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        matchId: null == matchId
            ? _value.matchId
            : matchId // ignore: cast_nullable_to_non_nullable
                  as int,
        player: null == player
            ? _value.player
            : player // ignore: cast_nullable_to_non_nullable
                  as Player,
        minute: null == minute
            ? _value.minute
            : minute // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScorerImpl implements _Scorer {
  const _$ScorerImpl({
    required this.id,
    @JsonKey(name: 'match_id') required this.matchId,
    required this.player,
    required this.minute,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$ScorerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScorerImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'match_id')
  final int matchId;
  @override
  final Player player;
  @override
  final int minute;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'Scorer(id: $id, matchId: $matchId, player: $player, minute: $minute, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScorerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, matchId, player, minute, createdAt);

  /// Create a copy of Scorer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScorerImplCopyWith<_$ScorerImpl> get copyWith =>
      __$$ScorerImplCopyWithImpl<_$ScorerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScorerImplToJson(this);
  }
}

abstract class _Scorer implements Scorer {
  const factory _Scorer({
    required final int id,
    @JsonKey(name: 'match_id') required final int matchId,
    required final Player player,
    required final int minute,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$ScorerImpl;

  factory _Scorer.fromJson(Map<String, dynamic> json) = _$ScorerImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'match_id')
  int get matchId;
  @override
  Player get player;
  @override
  int get minute;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of Scorer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScorerImplCopyWith<_$ScorerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
