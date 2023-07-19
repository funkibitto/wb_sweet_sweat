import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wb_sweet_sweat/core/mixins/notifire_update_mixin.dart';

part 'is_running_timer_notifier.g.dart';

@riverpod
class IsRunningTimerNotifier extends _$IsRunningTimerNotifier
    with NotifierUpdate {
  @override
  bool build() => false;

  bool get isRunning => state;
}
