import 'package:flutter/material.dart';
import '../viewmodels/game_viewmodel.dart';
import '../viewmodels/timer_viewmodel.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStartGame;
  final TimerViewModel timerViewModel;
  final GameViewModel gameViewModel;

  const StartScreen({
    super.key,
    required this.onStartGame, // Ensure onStartGame is required here
    required this.timerViewModel,
    required this.gameViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Game'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:
              onStartGame, // Call the onStartGame when the button is pressed
          child: const Text('Start Game'),
        ),
      ),
    );
  }
}
