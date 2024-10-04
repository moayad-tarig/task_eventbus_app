import 'package:event_bus/event_bus.dart';

mixin EventBusMixin {
  static final EventBus _eventBus = EventBus();

  EventBus get eventBus => _eventBus;

  void emit<T>(T event) {
    _eventBus.fire(event);
  }

  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }
}
