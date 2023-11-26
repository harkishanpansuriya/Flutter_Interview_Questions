int sum(int s, int e) {
  return s + e;
}

void main() {
  Set<int> mySet = {1, 3, 6, 10, 13, 15, 20};
  var result = mySet.reduce(sum);
  print('Result : $result');
}