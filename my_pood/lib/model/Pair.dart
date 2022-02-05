class Pair<T, S> {
  T first;
  S second;

  Pair({required this.first, required this.second});

  @override
  String toString() {
    return "Pair(first : $first, second : $second)";
  }
}
