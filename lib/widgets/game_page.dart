import 'package:bot_example_app/bloc/game_bloc.dart';
import 'package:bot_example_app/bloc/game_events.dart';
import 'package:bot_example_app/bloc/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game/game.dart';

class GamePageArguments {
  final int initialRocks;
  final List<Player> players;

  GamePageArguments(this.initialRocks, this.players);
}

class GamePage extends StatelessWidget {
  final GamePageArguments initialState;

  GamePage(this.initialState);

  static const String routeName = "/game";

  @override
  Widget build(BuildContext context) {
    print(initialState);
    return BlocProvider<GameBloc>(
      create: (BuildContext context) {
        return GameBloc(Game(initialState.initialRocks, initialState.players));
      },
      child: Scaffold(
        body: BlocBuilder<GameBloc, GameUiState>(
          builder: (context, state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'First player: ${state.firstPlayer}\nHeap size:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<GameBloc, GameUiState>(
          builder: (context, state) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(Event(1)),
                child: Text("1"),
                heroTag: "1",
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(Event(2)),
                child: Text("2"),
                heroTag: "2",
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(Event(3)),
                child: Text("3"),
                heroTag: "3",
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(Event(4)),
                child: Text("4"),
                heroTag: "4",
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(Event(5)),
                child: Text("5"),
                heroTag: "5",
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(Event(6)),
                child: Text("6"),
                heroTag: "6",
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<GameBloc>(context).add(StartGameEvent()),
                child: Text("Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
