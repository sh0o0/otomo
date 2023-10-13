final _functionNameRegex = RegExp(r"'(.*?)'");

extension TestEx on Object {
  String get _functionName {
    final matches = _functionNameRegex.allMatches(toString());
    if (matches.isEmpty) return '';
    final name = matches.last.group(1) ?? '';
    return '$name func.';
  }

  String get groupName {
    if (this is Function) return _functionName;
    return '${runtimeType.toString()} class.';
  }
}
