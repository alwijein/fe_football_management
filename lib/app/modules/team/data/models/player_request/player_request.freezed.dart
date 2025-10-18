// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlayerRequest _$PlayerRequestFromJson(Map<String, dynamic> json) {
  return _PlayerRequest.fromJson(json);
}

/// @nodoc
mixin _$PlayerRequest {
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'jersey_number')
  int get jerseyNumber => throw _privateConstructorUsedError;

  /// Serializes this PlayerRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerRequestCopyWith<PlayerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerRequestCopyWith<$Res> {
  factory $PlayerRequestCopyWith(
    PlayerRequest value,
    $Res Function(PlayerRequest) then,
  ) = _$PlayerRequestCopyWithImpl<$Res, PlayerRequest>;
  @useResult
  $Res call({
    String name,
    int height,
    int weight,
    String position,
    @JsonKey(name: 'jersey_number') int jerseyNumber,
  });
}

/// @nodoc
class _$PlayerRequestCopyWithImpl<$Res, $Val extends PlayerRequest>
    implements $PlayerRequestCopyWith<$Res> {
  _$PlayerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? position = null,
    Object? jerseyNumber = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as int,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String,
            jerseyNumber: null == jerseyNumber
                ? _value.jerseyNumber
                : jerseyNumber // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerRequestImplCopyWith<$Res>
    implements $PlayerRequestCopyWith<$Res> {
  factory _$$PlayerRequestImplCopyWith(
    _$PlayerRequestImpl value,
    $Res Function(_$PlayerRequestImpl) then,
  ) = __$$PlayerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    int height,
    int weight,
    String position,
    @JsonKey(name: 'jersey_number') int jerseyNumber,
  });
}

/// @nodoc
class __$$PlayerRequestImplCopyWithImpl<$Res>
    extends _$PlayerRequestCopyWithImpl<$Res, _$PlayerRequestImpl>
    implements _$$PlayerRequestImplCopyWith<$Res> {
  __$$PlayerRequestImplCopyWithImpl(
    _$PlayerRequestImpl _value,
    $Res Function(_$PlayerRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? position = null,
    Object? jerseyNumber = null,
  }) {
    return _then(
      _$PlayerRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String,
        jerseyNumber: null == jerseyNumber
            ? _value.jerseyNumber
            : jerseyNumber // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerRequestImpl implements _PlayerRequest {
  const _$PlayerRequestImpl({
    required this.name,
    required this.height,
    required this.weight,
    required this.position,
    @JsonKey(name: 'jersey_number') required this.jerseyNumber,
  });

  factory _$PlayerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerRequestImplFromJson(json);

  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  @override
  final String position;
  @override
  @JsonKey(name: 'jersey_number')
  final int jerseyNumber;

  @override
  String toString() {
    return 'PlayerRequest(name: $name, height: $height, weight: $weight, position: $position, jerseyNumber: $jerseyNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.jerseyNumber, jerseyNumber) ||
                other.jerseyNumber == jerseyNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, height, weight, position, jerseyNumber);

  /// Create a copy of PlayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerRequestImplCopyWith<_$PlayerRequestImpl> get copyWith =>
      __$$PlayerRequestImplCopyWithImpl<_$PlayerRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerRequestImplToJson(this);
  }
}

abstract class _PlayerRequest implements PlayerRequest {
  const factory _PlayerRequest({
    required final String name,
    required final int height,
    required final int weight,
    required final String position,
    @JsonKey(name: 'jersey_number') required final int jerseyNumber,
  }) = _$PlayerRequestImpl;

  factory _PlayerRequest.fromJson(Map<String, dynamic> json) =
      _$PlayerRequestImpl.fromJson;

  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  String get position;
  @override
  @JsonKey(name: 'jersey_number')
  int get jerseyNumber;

  /// Create a copy of PlayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerRequestImplCopyWith<_$PlayerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
