import 'package:bot_example_app/game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseEvent {}

class StartGameEvent extends BaseEvent {}

class Event extends BaseEvent {
  final int count;

  Event(int count) : count = count;
}

class GameUiState {
  GameUiState({this.counter, this.firstPlayer});

  final int counter;
  final bool firstPlayer;
}

class GameBloc extends Bloc<BaseEvent, GameUiState> {
  final Game _game;

  GameBloc(Game game)
      : _game = game,
        super(convert(game.getCurrentInfo()));

  @override
  Stream<GameUiState> mapEventToState(BaseEvent event) async* {
    if (event is Event && _game.isHumanTurn()) {
      _game.makeHumanTurn(event.count);
      yield convert(_game.getCurrentInfo());
    }

    while (!_game.gameOver() && !_game.isHumanTurn()) {
      GameUiState currentState = await Future.delayed(Duration(seconds: 1), () {
        _game.makeBotTurn();
        return convert(_game.getCurrentInfo());
      });
      yield currentState;
    }
  }

  static GameUiState convert(GameInfo info) {
    return GameUiState(counter: info.counter, firstPlayer: info.playerId == 0);
  }
}
