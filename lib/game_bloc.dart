import 'package:bot_example_app/game.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Event {
  final int count;

  Event(int count) : count = count;
}

class GameUiState {
  GameUiState({this.counter, this.firstPlayer});

  final int counter;
  final bool firstPlayer;
}

class GameBloc extends Bloc<Event, GameUiState> {
  final Game _game;

  GameBloc(Game game)
      : _game = game,
        super(convert(game.getCurrentInfo()));

  @override
  Stream<GameUiState> mapEventToState(Event event) async* {
    while (!_game.gameOver()) {
      print("!! ${_game.getCurrentInfo().counter}");
      // _game.makeTurn();
      // yield convert(_game.getCurrentInfo());
      GameUiState currentState = await Future.delayed(
          Duration(seconds: 1), () {
            // print("!");
            _game.makeTurn();
            return convert(_game.getCurrentInfo());
          });
      // print(currentState);
      yield currentState;
    }
  }

  static GameUiState convert(GameInfo info) {
    return GameUiState(counter: info.counter, firstPlayer: info.playerId == 0);
  }
}
