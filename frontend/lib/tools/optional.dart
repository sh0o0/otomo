extension Optional<T extends Object> on T? {
  V? apply<V>(V Function(T v) f) => this == null ? null : f(this!);
}
