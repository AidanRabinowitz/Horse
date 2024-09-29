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
    horseX = random.nextDouble();

    // Horse appears randomly vertically
    horseY = random.nextDouble();
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

  void updateGame(int currentPage) {
    // Case 1: Add more pages when a multiple of 9 is reached
    if (currentPage % 9 == 0 && currentPage > 0) {
      // Add 9 more pages
      List<Color> newPages =
          List<Color>.generate(9, (_) => _generateRandomColor());
      pageColors.addAll(newPages);
      print("Added 9 more pages. Total pages: ${pageColors.length}");
    }

    // Case 2: Move the horse if the user swipes past it
    if (currentPage > horsePage) {
      horsePage = random.nextInt(9) +
          currentPage +
          1; // Move horse to a random page in the next 9
      _setRandomHorsePosition();
      print("Horse moved to page $horsePage");
    }
  }
}
