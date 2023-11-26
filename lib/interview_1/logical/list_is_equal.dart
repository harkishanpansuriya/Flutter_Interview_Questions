void main() {
  List list1 = [24, 'Hello', 84];
  List list2 = [24, 'Hello', 84];
  print(isSame(list1, list2));
}

bool isSame(List list1, List list2) {
  if (list1 != list2) {
    return false;
  }
  return true;
}
