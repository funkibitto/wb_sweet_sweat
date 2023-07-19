import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/features/wakelock/service/wakelock_service.dart';

part 'wakelock_service_provider.g.dart';

@riverpod
WakelockService wakelockService(WakelockServiceRef ref) {
  final wakelockService = WakelockService();

  ref.onDispose(wakelockService.disable);

  return wakelockService;
}
