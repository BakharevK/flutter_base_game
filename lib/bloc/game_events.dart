abstract class BaseGameEvent {}

class StartGameEvent extends BaseGameEvent {}

class Event extends BaseGameEvent {
  final int count;

  Event(int count) : count = count;
}