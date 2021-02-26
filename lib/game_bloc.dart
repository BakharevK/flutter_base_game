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
  GameBloc(GameUiState initialState) : super(initialState);

  @override
  Stream<GameUiState> mapEventToState(Event event) async* {
    int counter = this.state.counter;
    yield GameUiState(
        counter: counter - event.count,
        firstPlayer: this.state.firstPlayer ^ true);
  }
}
