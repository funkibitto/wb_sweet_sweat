// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'dashboard.freezed.dart';

@freezed
class Dashboard with _$Dashboard {
  const Dashboard._();
  const factory Dashboard({
    required double speed,
    required double topSpeed,
    required double averageSpeed,
    required double calorie,
    required double distance,
    Position? position,
  }) = _Dashboard;

  String get distanceString => distance >= 1000
      ? '${(distance / 1000).toStringAsFixed(1)} km'
      : '${distance.toInt()} m';
}
