import 'package:flutter/material.dart';
import 'package:rxdart/streams.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerService {
  late StopWatchTimer timer;

  final VoidCallback? onStopped;
  final VoidCallback? onEnded;
  final VoidCallback? onStarted;
  final VoidCallback? onReset;

  TimerService({
    this.onStopped,
    this.onEnded,
    this.onStarted,
    this.onReset,
  }) {
    timer = StopWatchTimer(
      mode: StopWatchMode.countUp,
    );
  }

  ValueStream<int> get rawTime => timer.rawTime;

  int get currentRawTime => timer.rawTime.value;

  void start() {
    timer.onStartTimer();
    onStarted?.call();
  }

  void stop() {
    timer.onStopTimer();
    onStopped?.call();
  }

  void reset() {
    timer.onResetTimer();
    onReset?.call();
  }

  void dispose() {
    timer.dispose();
  }
}
