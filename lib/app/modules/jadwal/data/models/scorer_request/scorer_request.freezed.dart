// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scorer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScorerRequest _$ScorerRequestFromJson(Map<String, dynamic> json) {
  return _ScorerRequest.fromJson(json);
}

/// @nodoc
mixin _$ScorerRequest {
  @JsonKey(name: 'player_id')
  int get playerId => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  /// Serializes this ScorerRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScorerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScorerRequestCopyWith<ScorerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScorerRequestCopyWith<$Res> {
  factory $ScorerRequestCopyWith(
    ScorerRequest value,
    $Res Function(ScorerRequest) then,
  ) = _$ScorerRequestCopyWithImpl<$Res, ScorerRequest>;
  @useResult
  $Res call({@JsonKey(name: 'player_id') int playerId, int minute});
}

/// @nodoc
class _$ScorerRequestCopyWithImpl<$Res, $Val extends ScorerRequest>
    implements $ScorerRequestCopyWith<$Res> {
  _$ScorerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScorerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null, Object? minute = null}) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as int,
            minute: null == minute
                ? _value.minute
                : minute // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScorerRequestImplCopyWith<$Res>
    implements $ScorerRequestCopyWith<$Res> {
  factory _$$ScorerRequestImplCopyWith(
    _$ScorerRequestImpl value,
    $Res Function(_$ScorerRequestImpl) then,
  ) = __$$ScorerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'player_id') int playerId, int minute});
}

/// @nodoc
class __$$ScorerRequestImplCopyWithImpl<$Res>
    extends _$ScorerRequestCopyWithImpl<$Res, _$ScorerRequestImpl>
    implements _$$ScorerRequestImplCopyWith<$Res> {
  __$$ScorerRequestImplCopyWithImpl(
    _$ScorerRequestImpl _value,
    $Res Function(_$ScorerRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScorerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null, Object? minute = null}) {
    return _then(
      _$ScorerRequestImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as int,
        minute: null == minute
            ? _value.minute
            : minute // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScorerRequestImpl implements _ScorerRequest {
  const _$ScorerRequestImpl({
    @JsonKey(name: 'player_id') required this.playerId,
    required this.minute,
  });

  factory _$ScorerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScorerRequestImplFromJson(json);

  @override
  @JsonKey(name: 'player_id')
  final int playerId;
  @override
  final int minute;

  @override
  String toString() {
    return 'ScorerRequest(playerId: $playerId, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScorerRequestImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, minute);

  /// Create a copy of ScorerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScorerRequestImplCopyWith<_$ScorerRequestImpl> get copyWith =>
      __$$ScorerRequestImplCopyWithImpl<_$ScorerRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScorerRequestImplToJson(this);
  }
}

abstract class _ScorerRequest implements ScorerRequest {
  const factory _ScorerRequest({
    @JsonKey(name: 'player_id') required final int playerId,
    required final int minute,
  }) = _$ScorerRequestImpl;

  factory _ScorerRequest.fromJson(Map<String, dynamic> json) =
      _$ScorerRequestImpl.fromJson;

  @override
  @JsonKey(name: 'player_id')
  int get playerId;
  @override
  int get minute;

  /// Create a copy of ScorerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScorerRequestImplCopyWith<_$ScorerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
