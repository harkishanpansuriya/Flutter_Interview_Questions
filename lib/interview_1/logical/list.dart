void main() {
  List myList = [1, 2, 3];
  myList[0] = 123;
  print(myList);

  //Second Method - using .replaceRange() method
  var myList2 = [10, 20, 30, 40, 50];
  myList2.replaceRange(0, 2, [11, 21]);
  print(myList2);

  List<String> subjects = ["math", "physics", "chemistry"];
  subjects.insert(0, "english");
  print(subjects);

  List<int> numbers = [1, 2, 3, 4, 5];

  int sum = numbers.reduce((value, element) => value + element);

  // Take the first 3 elements
  var firstThree = numbers.take(3);
  print("sum of numbers $sum");
  print("Take method $firstThree"); // Take elements while they are less than 4
  var lessThanFour = numbers.takeWhile((element) => element < 4);

  print(lessThanFour); // Output: (1, 2, 3)/ Output: (1, 2, 3)

  // Skip the first 2 elements
  var skipTwo = numbers.skip(2);

  print(skipTwo); // Output: (3, 4, 5)

  // Skip elements while they are less than 3
  var skipLessThanThree = numbers.skipWhile((element) => element < 3);

  print(skipLessThanThree); // Output: (3, 4, 5)

  // Retain only the even numbers
  numbers.retainWhere((element) => element.isEven);

  print(numbers); // Output: [2, 4]
}
