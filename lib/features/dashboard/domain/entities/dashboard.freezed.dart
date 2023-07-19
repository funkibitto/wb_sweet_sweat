// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Dashboard {
  double get speed => throw _privateConstructorUsedError;
  double get topSpeed => throw _privateConstructorUsedError;
  double get averageSpeed => throw _privateConstructorUsedError;
  double get calorie => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  Position? get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {double speed,
      double topSpeed,
      double averageSpeed,
      double calorie,
      double distance,
      Position? position});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? topSpeed = null,
    Object? averageSpeed = null,
    Object? calorie = null,
    Object? distance = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      topSpeed: null == topSpeed
          ? _value.topSpeed
          : topSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      averageSpeed: null == averageSpeed
          ? _value.averageSpeed
          : averageSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      calorie: null == calorie
          ? _value.calorie
          : calorie // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$$_DashboardCopyWith(
          _$_Dashboard value, $Res Function(_$_Dashboard) then) =
      __$$_DashboardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double speed,
      double topSpeed,
      double averageSpeed,
      double calorie,
      double distance,
      Position? position});
}

/// @nodoc
class __$$_DashboardCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$_Dashboard>
    implements _$$_DashboardCopyWith<$Res> {
  __$$_DashboardCopyWithImpl(
      _$_Dashboard _value, $Res Function(_$_Dashboard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? topSpeed = null,
    Object? averageSpeed = null,
    Object? calorie = null,
    Object? distance = null,
    Object? position = freezed,
  }) {
    return _then(_$_Dashboard(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      topSpeed: null == topSpeed
          ? _value.topSpeed
          : topSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      averageSpeed: null == averageSpeed
          ? _value.averageSpeed
          : averageSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      calorie: null == calorie
          ? _value.calorie
          : calorie // ignore: cast_nullable_to_non_nullable
              as double,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc

class _$_Dashboard extends _Dashboard {
  const _$_Dashboard(
      {required this.speed,
      required this.topSpeed,
      required this.averageSpeed,
      required this.calorie,
      required this.distance,
      this.position})
      : super._();

  @override
  final double speed;
  @override
  final double topSpeed;
  @override
  final double averageSpeed;
  @override
  final double calorie;
  @override
  final double distance;
  @override
  final Position? position;

  @override
  String toString() {
    return 'Dashboard(speed: $speed, topSpeed: $topSpeed, averageSpeed: $averageSpeed, calorie: $calorie, distance: $distance, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dashboard &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.topSpeed, topSpeed) ||
                other.topSpeed == topSpeed) &&
            (identical(other.averageSpeed, averageSpeed) ||
                other.averageSpeed == averageSpeed) &&
            (identical(other.calorie, calorie) || other.calorie == calorie) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, speed, topSpeed, averageSpeed, calorie, distance, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      __$$_DashboardCopyWithImpl<_$_Dashboard>(this, _$identity);
}

abstract class _Dashboard extends Dashboard {
  const factory _Dashboard(
      {required final double speed,
      required final double topSpeed,
      required final double averageSpeed,
      required final double calorie,
      required final double distance,
      final Position? position}) = _$_Dashboard;
  const _Dashboard._() : super._();

  @override
  double get speed;
  @override
  double get topSpeed;
  @override
  double get averageSpeed;
  @override
  double get calorie;
  @override
  double get distance;
  @override
  Position? get position;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
