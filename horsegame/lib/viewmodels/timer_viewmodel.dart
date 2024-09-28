import '../models/timer_model.dart';

class TimerViewModel {
  final TimerModel _timerModel = TimerModel();

  Duration get timeElapsed => _timerModel.timeElapsed;
  bool get isRunning => _timerModel.isRunning;

  void startTimer() => _timerModel.start();
  void stopTimer() => _timerModel.stop();
  void resetTimer() => _timerModel.reset();
}
