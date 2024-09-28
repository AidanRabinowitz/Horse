import 'package:flutter/material.dart';
import 'views/start_screen.dart';
import 'viewmodels/game_viewmodel.dart';
import 'viewmodels/timer_viewmodel.dart';
import 'views/game_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => StartScreen(
          onStartGame: () {
            // Create instances of both view models before starting the game
            final gameViewModel = GameViewModel();
            final timerViewModel = TimerViewModel();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GamePage(
                  gameViewModel:
                      gameViewModel, // Pass gameViewModel to GamePage
                  timerViewModel:
                      timerViewModel, // Pass timerViewModel to GamePage
                ),
              ),
            );
          },
          timerViewModel: TimerViewModel(),
          gameViewModel: GameViewModel(),
        ),
      ),
    );
  }
}
