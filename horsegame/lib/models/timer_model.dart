import 'dart:async';

class TimerModel {
  Timer? _timer;
  Duration _timeElapsed = Duration.zero;
  bool _isRunning = false;

  Duration get timeElapsed => _timeElapsed;
  bool get isRunning => _isRunning;

  void start() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeElapsed = _timeElapsed + const Duration(seconds: 1);
    });
  }

  void stop() {
    _isRunning = false;
    _timer?.cancel();
  }

  void reset() {
    stop();
    _timeElapsed = Duration.zero;
  }
}
