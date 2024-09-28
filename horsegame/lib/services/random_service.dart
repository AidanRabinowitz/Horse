import 'dart:math';

class RandomService {
  final Random _random = Random();

  int getRandomPage(int maxPages) {
    return _random.nextInt(maxPages);
  }

  int getNextHorsePage(int currentPage, int totalPages) {
    return _random.nextInt(totalPages - currentPage) + currentPage + 1;
  }
}
