import 'dart:ui';
import '../models/game_state_model.dart';

class GameViewModel {
  final GameStateModel _gameStateModel = GameStateModel();

  int get currentPage => _gameStateModel.currentPage;
  List<Color> get pageColors => _gameStateModel.pageColors;
  bool isHorseOnPage(int page) => _gameStateModel.isHorsePage(page);

  // Initialize game state, generating colors and horse position
  void initializeGame() {
    _gameStateModel.initializeGame();
  }

  // Called when the user swipes to a new page
  void handlePageChange(int newPageIndex) {
    _gameStateModel.currentPage = newPageIndex;
    // Move the horse if it needs to be moved
    // moveHorseIfNeeded(newPageIndex);
  }

  // Move the horse if the current page matches some condition (e.g., not where the horse is)
  void moveHorseIfNeeded(int currentPage) {
    _gameStateModel.moveHorse(currentPage);
  }

  void updateGame(int currentPage) {
    _gameStateModel
        .updateGame(currentPage); // Call the new function in the model
  }
}
