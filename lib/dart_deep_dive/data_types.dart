void main() {
  // int
  int age = 30;

  // double
  double price = 19.99;

  // String
  String name = "John Doe";

  // bool
  bool isDartFun = true;

  // List
  List<int> numbers = [1, 2, 3, 4, 5];

  // Map
  Map<String, dynamic> person = {
    'name': 'Alice',
    'age': 28,
  };

  // Set
  Set<String> uniqueNames = {'Alice', 'Bob', 'Alice'};

  // dynamic
  dynamic variable = 42;
  variable = 'Hello, Dart!';

  // var
  var x = 10; // Dart infers that x is an int
  var message = 'Hello'; // Dart infers that message is a String

  // final
  const piValue = 3.14159265359;

  // const
  const int daysInAWeek = 7;

  // Runes
  String emoji = '😃'; // This emoji consists of two code units
  Runes runes = emoji.runes;

  for (var rune in runes) {
    print('Unicode code point: $rune, Character: ${String.fromCharCode(rune)}');
  }
}

// 1. Numbers: Dart has three numeric data types - int, double, and num.
//    - int represents whole numbers.
//    - double represents floating-point numbers (decimal values).
//    - num is a generic type that can represent both int and double.

// 2. Strings: The String data type represents sequences of characters.
//    It is used for handling text data in Dart.

// 3. Booleans: Booleans in Dart are represented by the 'bool' data type,
//    which can have two values: 'true' and 'false'.

// 4. Lists: Lists in Dart are ordered collections of items.
//    They can hold multiple values of the same or different data types.

// 5. Maps: Maps are used to represent key-value pairs in Dart.
//    They associate keys with corresponding values.

// 6. Sets: A Set in Dart is an unordered collection of unique values.
//    Sets ensure that each element is unique and of the same data type.

// 7. Runes: Dart has a 'runes' data type used to represent Unicode values
//    of characters in a String, especially for handling special characters.

// 8. Null: The 'null' data type represents the absence of a value.
//    It is often used to indicate that a variable does not currently have a value.
