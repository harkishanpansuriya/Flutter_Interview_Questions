void main() {
  List<int> nums = [5, 6, 2, 1, 4];

  int thirdLargestNum = find3rdLargestNumber(nums);

  print(thirdLargestNum);
}

int find3rdLargestNumber(List<int> numbers) {
  if (numbers.length < 3) {
    return -1;
  }

  numbers.sort((a, b) => b.compareTo(a));

  return numbers[2];
}
