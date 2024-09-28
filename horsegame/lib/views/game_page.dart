import 'package:flutter/material.dart';
import 'package:horsegame/views/victory_popup.dart';
import 'package:horsegame/widgets/timer_display.dart';
import '../viewmodels/game_viewmodel.dart';
import '../viewmodels/timer_viewmodel.dart';
import '../views/coloured_page.dart';

class GamePage extends StatefulWidget {
  final GameViewModel gameViewModel;
  final TimerViewModel timerViewModel;

  const GamePage(
      {super.key, required this.gameViewModel, required this.timerViewModel});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    widget.timerViewModel.startTimer();
    widget.gameViewModel
        .initializeGame(); // Initialize the game when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.gameViewModel.pageColors.length,
            onPageChanged: (index) {
              setState(() {
                widget.gameViewModel
                    .handlePageChange(index); // Handle page change in ViewModel
              });
            },
            itemBuilder: (context, index) {
              return ColouredPage(
                color: widget.gameViewModel.pageColors[index],
                hasHorse: widget.gameViewModel.isHorseOnPage(index),
                onHorseTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const VictoryPopup(),
                  );
                  widget.timerViewModel.stopTimer();
                },
              );
            },
          ),
          // Timer displayed at the top-left corner
          Positioned(
            top: 20,
            left: 20,
            child: TimerDisplay(timerViewModel: widget.timerViewModel),
          ),
        ],
      ),
    );
  }
}
