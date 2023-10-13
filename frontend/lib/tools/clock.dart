Clock clock = const ClockImpl();

void setClock(Clock newClock) {
  clock = newClock;
}

abstract class Clock {
  DateTime now();
}

class ClockImpl implements Clock {
  const ClockImpl();

  @override
  DateTime now() => DateTime.now();
}
