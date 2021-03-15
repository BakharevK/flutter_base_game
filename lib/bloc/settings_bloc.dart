import 'package:bot_example_app/bloc/settings_events.dart';
import 'package:bot_example_app/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<BaseSettingsEvent, SettingsUiState> {
  SettingsBloc(SettingsUiState state) : super(state);

  @override
  Stream<SettingsUiState> mapEventToState(BaseSettingsEvent event) async* {
    int rocks = state.rocks;
    int players = state.players;

    if (event is ChangePlayersEvent) {
      players = event.players;
    }
    if (event is ChangeRocksEvent) {
      rocks = event.rocks;
    }

    yield SettingsUiState(players, rocks);
  }
}
