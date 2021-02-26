import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) {
          return GameBloc(GameUiState(counter: 100, firstPlayer: true));
        },
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: BlocBuilder<GameBloc, GameUiState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => BlocProvider.of<GameBloc>(context).add(Event(1)),
            child: Text("1"),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<GameBloc>(context).add(Event(2)),
            child: Text("2"),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<GameBloc>(context).add(Event(3)),
            child: Text("3"),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<GameBloc>(context).add(Event(4)),
            child: Text("4"),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<GameBloc>(context).add(Event(5)),
            child: Text("5"),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<GameBloc>(context).add(Event(6)),
            child: Text("6"),
          ),
        ],
      ),
    );
  }
}
