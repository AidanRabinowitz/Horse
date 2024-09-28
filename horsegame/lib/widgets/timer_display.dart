import 'package:flutter/material.dart';
import '../viewmodels/timer_viewmodel.dart';

class TimerDisplay extends StatelessWidget {
  final TimerViewModel timerViewModel;

  const TimerDisplay({super.key, required this.timerViewModel});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
          const Duration(seconds: 1), (_) => timerViewModel.timeElapsed),
      builder: (context, snapshot) {
        final timeElapsed = timerViewModel.timeElapsed;
        final minutes = timeElapsed.inMinutes.toString().padLeft(2, '0');
        final seconds = (timeElapsed.inSeconds % 60).toString().padLeft(2, '0');

        return Text(
          'Time: $minutes:$seconds',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
