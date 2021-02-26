import 'dart:math';

abstract class Player {
  int makeTurn(GameInfo state);
}

class GreedyPlayer extends Player {
  @override
  int makeTurn(GameInfo state) {
    return min(state.counter, 6);
  }
}

class HumanPlayer extends Player {
  @override
  int makeTurn(GameInfo state) {
    throw UnimplementedError();
  }
}

class GameInfo {
  GameInfo({this.counter, this.playerId, this.players});

  int counter;
  int playerId;
  List<Player> players;
}

class Game {
  final GameInfo info;

  Game(int counter, int playersNumber)
      : info = GameInfo(
            counter: counter,
            playerId: 0,
            players: List.generate(playersNumber, (index) => GreedyPlayer()));

  bool gameOver() {
    return info.counter <= 0;
  }

  void makeTurn() {
    Player currentPlayer = info.players[info.playerId];
    int turn = currentPlayer.makeTurn(info);
    info.counter -= turn;
    info.playerId += 1;
    info.playerId = info.playerId % info.players.length;
  }

  GameInfo getCurrentInfo() {
    return GameInfo(
        counter: info.counter,
        playerId: info.playerId,
        players: List.from(info.players));
  }
}
