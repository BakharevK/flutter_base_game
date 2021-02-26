class Player {
  void makeTurn() {

  }
}

class GameState {

}

class Game {
  int counter = 0;

  Future<int> getNextInt() async {
    return Future.delayed(Duration(seconds: 1), () => counter++);
  }


  void main() async {
    while (true) {
      int current;
      current = await getNextInt();
      print(current);
    }
  }
}

void main() async {
  Game().main();
}