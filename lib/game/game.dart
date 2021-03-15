import 'dart:math';

abstract class Player {}

abstract class BotPlayer extends Player {
  int makeTurn(GameInfo state);
}

class HumanPlayer extends Player {}

class GreedyPlayer extends BotPlayer {
  @override
  int makeTurn(GameInfo state) {
    return min(state.counter, 6);
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

  Game(int counter, List<Player> players)
      : info = GameInfo(counter: counter, playerId: 0, players: players);

  bool gameOver() {
    return info.counter <= 0;
  }

  void makeBotTurn() {
    if (info.players[info.playerId] is BotPlayer) {
      BotPlayer currentPlayer = info.players[info.playerId] as BotPlayer;
      int turn = currentPlayer.makeTurn(info);
      info.counter -= turn;
      info.playerId += 1;
      info.playerId = info.playerId % info.players.length;
      print(info.counter);
    } else {
      throw UnimplementedError("Go f*ck yourself");
    }
  }

  GameInfo getCurrentInfo() {
    return GameInfo(
        counter: info.counter,
        playerId: info.playerId,
        players: List.from(info.players));
  }

  bool isHumanTurn() {
    return info.players[info.playerId] is HumanPlayer;
  }

  void makeHumanTurn(int taken) {
    info.counter -= taken;
    info.playerId += 1;
    info.playerId = info.playerId % info.players.length;
  }
}
