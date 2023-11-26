void main() {
  // for (var i = 0; i <= 2; i++) {
  //   if (i == 1) break;
  //   print(i);
  // }

  //Loop through dictionary of maps
  List subjects = [
    {"id": 1, "name": "Math"},
    {"id": 2, "name": "Physics"},
    {"id": 1, "name": "Chemistry"}
  ];
  subjects.removeWhere((element) => element["id"] == 1);
  for (var item in subjects) {
    print(item);
  }
}
