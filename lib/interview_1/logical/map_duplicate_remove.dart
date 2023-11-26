void main() {
  List<Map<String, dynamic>> userListMap = [
    {
      'name': 'John Doe',
      'age': 30,
    },
    {
      'name': 'Jane Smith',
      'age': 25,
    },
    {
      'name': 'John Doe',
      'age': 35,
    },
    {
      'name': 'Alice Johnson',
      'age': 28,
    },
  ];

  userListMap.removeWhere(
      (user) => userListMap.where((u) => u['name'] == user['name']).length > 1);

  print(userListMap);
}
