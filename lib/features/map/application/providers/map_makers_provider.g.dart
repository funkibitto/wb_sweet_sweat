// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_makers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapMarkersMyPositionHash() =>
    r'abf2c6da73b0f9fe2e804e5f9038c94ede5ddf7f';

/// See also [mapMarkersMyPosition].
@ProviderFor(mapMarkersMyPosition)
final mapMarkersMyPositionProvider =
    AutoDisposeProvider<Option<Marker>>.internal(
  mapMarkersMyPosition,
  name: r'mapMarkersMyPositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapMarkersMyPositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapMarkersMyPositionRef = AutoDisposeProviderRef<Option<Marker>>;
String _$myLocationMarkerIconHash() =>
    r'6f324fac1d7ee8328b4619bc1767ce02f8fe43ae';

/// See also [myLocationMarkerIcon].
@ProviderFor(myLocationMarkerIcon)
final myLocationMarkerIconProvider =
    AutoDisposeFutureProvider<BitmapDescriptor>.internal(
  myLocationMarkerIcon,
  name: r'myLocationMarkerIconProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myLocationMarkerIconHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MyLocationMarkerIconRef
    = AutoDisposeFutureProviderRef<BitmapDescriptor>;
String _$mapMarkersNotifierHash() =>
    r'7580e0261d9f82ae4be9b142843a812dc719986b';

/// See also [MapMarkersNotifier].
@ProviderFor(MapMarkersNotifier)
final mapMarkersNotifierProvider =
    AutoDisposeNotifierProvider<MapMarkersNotifier, Set<Marker>>.internal(
  MapMarkersNotifier.new,
  name: r'mapMarkersNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapMarkersNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapMarkersNotifier = AutoDisposeNotifier<Set<Marker>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
