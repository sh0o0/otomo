Clock clock = const _ClockImpl();

void setClock(Clock newClock) {
  clock = newClock;
}

abstract class Clock {
  DateTime now();
}

class _ClockImpl implements Clock {
  const _ClockImpl();

  @override
  DateTime now() => DateTime.now();
}
