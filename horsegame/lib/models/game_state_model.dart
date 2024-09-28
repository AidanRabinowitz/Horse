import 'package:flutter/material.dart';
import 'dart:math';

class GameStateModel {
  int currentPage = 0;
  int horsePage = -1;
  List<Color> pageColors = [];
  Random random = Random();

  double horseX = 0.0;
  double horseY = 0.0;

  void initializeGame() {
    currentPage = 0;
    horsePage = random.nextInt(10); // Random horse page
    pageColors = List<Color>.generate(10, (_) => _generateRandomColor());

    // Randomize the horse position with constraints to avoid overlap with the timer (top-left corner)
    _setRandomHorsePosition();
  }

  void _setRandomHorsePosition() {
    // Ensure horse does not overlap with the top-left corner (timer area)
    const double margin = 100.0; // Keep the horse away from the top-left corner
    horseX = random.nextDouble() * (1.0 - margin) + margin;
    horseY = random.nextDouble() * (1.0 - margin) + margin;
  }

  void moveHorse(int currentPage) {
    horsePage =
        random.nextInt(10 - currentPage) + currentPage + 1; // Move horse ahead
    _setRandomHorsePosition(); // Recalculate horse position
  }

  bool isHorsePage(int page) => horsePage == page;

  Color _generateRandomColor() {
    return Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
