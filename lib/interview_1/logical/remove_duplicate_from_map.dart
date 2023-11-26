void main() {
  final list = [
    {"name": "John", "age": 25},
    {"name": "John", "age": 23},
    {"name": "John", "age": 24},
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 28},
    {"name": "Alice", "age": 29},
  ];

  final uniqueName = <String>{};
  final duplicatedList = <Map<String, dynamic>>[];

  for (var item in list) {
    final name = item["name"] as String;
    if (!uniqueName.contains(name)) {
      uniqueName.add(name);
      duplicatedList.add(item);
    }
  }
  print(duplicatedList);
}
