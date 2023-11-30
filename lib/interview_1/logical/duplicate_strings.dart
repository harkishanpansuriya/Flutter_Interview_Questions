void main() {
  final list = [
    "apple",
    "banana",
    "apple",
    "cherry",
    "banana",
    "apple",
    "date",
    "date"
  ];
  final counts = <String, int>{};

  for (String item in list) {
    print('Processing item: ${counts[item]}, Count: ${(counts[item] ?? 0) + 1}');
    counts[item] = (counts[item] ?? 0) + 1;
  }

  Set<String> vvv = list.toSet();

  print(vvv);

  counts.forEach((key, value) {
    print('$key: $value times');
  });
}
