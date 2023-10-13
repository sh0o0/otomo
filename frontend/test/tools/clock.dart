import 'package:otomo/tools/clock.dart';

void setTestClock() {
  setClock(TestClockImpl(DateTime.now()));
}

class TestClockImpl implements Clock {
  final DateTime _now;

  const TestClockImpl(this._now);

  @override
  DateTime now() => _now;
}
