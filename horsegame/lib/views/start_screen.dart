import 'package:flutter/material.dart';
import '../viewmodels/game_viewmodel.dart';
import '../viewmodels/timer_viewmodel.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStartGame;
  final TimerViewModel timerViewModel;
  final GameViewModel gameViewModel;

  const StartScreen({
    super.key,
    required this.onStartGame,
    required this.timerViewModel,
    required this.gameViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Game logo/icon
                const Icon(
                  Icons.pets,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                // Title
                const Text(
                  'Find the Horse!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // Instructions
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Swipe to find and click on the horse, as fast as you can!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                // Start Game Button
                ElevatedButton(
                  onPressed: onStartGame,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Start Game',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
