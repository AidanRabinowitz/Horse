import 'package:flutter/material.dart';
import 'dart:math';

class GameStateModel {
  int currentPage = 0;
  int horsePage = -1;
  List<Color> pageColors = [];
  Random random = Random();

  double horseX = 20.0;
  double horseY = -5.0;

  void initializeGame() {
    currentPage = 1;
    horsePage = random.nextInt(10); // Random horse page
    pageColors = List<Color>.generate(10, (_) => _generateRandomColor());

    // Randomize the horse position with constraints to avoid overlap with the timer (top-left corner)
    _setRandomHorsePosition();
  }

  void _setRandomHorsePosition() {
    // // Horse appears only on the right half of the screen
    // horseX = random.nextDouble();

    // // Horse appears randomly vertically
    // horseY = random.nextDouble();
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
