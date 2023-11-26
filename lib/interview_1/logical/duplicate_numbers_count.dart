void main() {
  final list = [1, 1, 1, 2, 2, 2, 3, 3, 3, 4];

  Map<int, int> counts = {};

  for (int item in list) {
    counts[item] = (counts[item] ?? 0) + 1;
    print("object ${(counts[item] ?? 0)}");
  }

  counts.forEach((key, value) {
    print("$key $value");
  });
}
