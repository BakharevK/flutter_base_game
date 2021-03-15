import 'package:bot_example_app/bloc/settings_bloc.dart';
import 'package:bot_example_app/bloc/settings_events.dart';
import 'package:bot_example_app/bloc/settings_state.dart';
import 'package:bot_example_app/game/game.dart';
import 'package:bot_example_app/widgets/game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "/settings";

  SettingsPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SettingsBloc(SettingsUiState(2, 100));
      },
      child: BlocBuilder<SettingsBloc, SettingsUiState>(
        builder: (context, state) => Container(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Players",
                  style: TextStyle(fontSize: 20),
                ),
                Slider(
                  value: state.players.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: state.players.toString(),
                  onChanged: (value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(ChangePlayersEvent(value.round()));
                  },
                ),
                Text(
                  "Rocks",
                  style: TextStyle(fontSize: 20),
                ),
                Slider(
                  value: state.rocks.toDouble(),
                  min: 50,
                  max: 150,
                  divisions: 10,
                  label: state.rocks.toString(),
                  onChanged: (value) {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(ChangeRocksEvent(value.round()));
                  },
                ),
                TextButton(
                  child: Text(
                    "Play",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      GamePage.routeName,
                      arguments: GamePageArguments(
                          state.rocks, [GreedyPlayer(), GreedyPlayer()]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
