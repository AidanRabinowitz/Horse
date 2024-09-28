import 'dart:ui';

import '../models/game_state_model.dart';

class GameViewModel {
  final GameStateModel _gameStateModel = GameStateModel();

  int get currentPage => _gameStateModel.currentPage;
  List<Color> get pageColors => _gameStateModel.pageColors;
  bool isHorseOnPage(int page) => _gameStateModel.isHorsePage(page);

  void initializeGame() {
    _gameStateModel.initializeGame();
  }

  void moveHorseIfNeeded(int currentPage) {
    _gameStateModel.moveHorse(currentPage);
  }
}
