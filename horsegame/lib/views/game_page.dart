import 'package:flutter/material.dart';
import 'package:horsegame/views/victory_popup.dart';
import 'package:horsegame/widgets/timer_display.dart';
import '../viewmodels/game_viewmodel.dart';
import '../viewmodels/timer_viewmodel.dart';
import '../views/coloured_page.dart';

// Custom ScrollPhysics to disable backward swipe
class NoBackSwipePhysics extends ScrollPhysics {
  const NoBackSwipePhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  NoBackSwipePhysics applyTo(ScrollPhysics? ancestor) {
    return NoBackSwipePhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels) {
      // Prevent backward swiping
      return value - position.pixels;
    }
    return 0.0;
  }
}

class GamePage extends StatefulWidget {
  final GameViewModel gameViewModel;
  final TimerViewModel timerViewModel;

  const GamePage(
      {super.key, required this.gameViewModel, required this.timerViewModel});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    widget.timerViewModel.startTimer();
    widget.gameViewModel.initializeGame(); // Initialize the game state
    _pageController = PageController(); // Initialize the PageController
  }

  @override
  void dispose() {
    _pageController.dispose(); // Clean up the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for swiping through pages
          PageView.builder(
            controller: _pageController,
            physics: const NoBackSwipePhysics(), // Disable backward swipe
            itemCount: widget.gameViewModel.pageColors.length,
            onPageChanged: (index) {
              setState(() {
                widget.gameViewModel.updateGame(index); // Handle game updates
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
                  widget.timerViewModel.stopTimer(); // Stop the timer
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
