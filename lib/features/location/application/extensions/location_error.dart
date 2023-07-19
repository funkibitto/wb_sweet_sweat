import 'package:flutter/material.dart';

enum LocationError {
  notEnabledLocation,
  notGrantedLocationPermission,
  getLocationTimeout,
}

extension LocationErrorExtension on LocationError {
  String getErrorText(BuildContext context) {
    return 'error!!!!';
  }
}
