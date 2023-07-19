// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationServiceHash() => r'f7b3dbe3e362693a99dbd0c857f576f80a3f5f74';

/// See also [locationService].
@ProviderFor(locationService)
final locationServiceProvider = AutoDisposeProvider<LocationService>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationServiceRef = AutoDisposeProviderRef<LocationService>;
String _$locationStreamHash() => r'cfe6f2cd7289fd47b4eb37e2fc99497349d67082';

/// See also [locationStream].
@ProviderFor(locationStream)
final locationStreamProvider = AutoDisposeStreamProvider<Position>.internal(
  locationStream,
  name: r'locationStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationStreamRef = AutoDisposeStreamProviderRef<Position>;
String _$locationRequestPermissionHash() =>
    r'8d5fbca01e813c48ee37c190eeed34bfd86105cc';

/// See also [locationRequestPermission].
@ProviderFor(locationRequestPermission)
final locationRequestPermissionProvider =
    AutoDisposeFutureProvider<void>.internal(
  locationRequestPermission,
  name: r'locationRequestPermissionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationRequestPermissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationRequestPermissionRef = AutoDisposeFutureProviderRef<void>;
String _$locationPermissionStateHash() =>
    r'20cfb6ea0a347737b0afbb400d555afe587626f9';

/// See also [LocationPermissionState].
@ProviderFor(LocationPermissionState)
final locationPermissionStateProvider =
    NotifierProvider<LocationPermissionState, LocationPermission>.internal(
  LocationPermissionState.new,
  name: r'locationPermissionStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationPermissionStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationPermissionState = Notifier<LocationPermission>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
