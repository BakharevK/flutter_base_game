import 'package:flutter_bloc/flutter_bloc.dart';

import '../game/game.dart';
import 'game_events.dart';
import 'game_state.dart';

class GameBloc extends Bloc<BaseGameEvent, GameUiState> {
  final Game _game;

  GameBloc(Game game)
      : _game = game,
        super(convert(game.getCurrentInfo()));

  @override
  Stream<GameUiState> mapEventToState(BaseGameEvent event) async* {
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
