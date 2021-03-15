abstract class BaseSettingsEvent {}

class ChangePlayersEvent extends BaseSettingsEvent {
  final int players;

  ChangePlayersEvent(this.players);
}

class ChangeRocksEvent extends BaseSettingsEvent {
  final int rocks;

  ChangeRocksEvent(this.rocks);
}