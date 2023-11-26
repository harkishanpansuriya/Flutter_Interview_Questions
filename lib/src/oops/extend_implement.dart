class First {
  static int num = 1; // Static variable in First class.
  void firstFunc() {
    print('hello'); // Method in First class that prints 'hello'.
  }
}

class Second extends First {
  // Second class extends First class and inherits firstFunc().
}

class Third implements First {
  @override
  void firstFunc() {
    // Custom implementation of firstFunc() in Third class.
  }
}

void main() {
  var one = First(); // Create an instance of First class.
  one.firstFunc(); // Output: 'hello' from First class.
  print(First.num); // Output: 1 (accessing a static variable in First class).

  var second = Second(); // Create an instance of Second class.
  second.firstFunc(); // Output: 'hello' (inherited from First class).

  var third = Third(); // Create an instance of Third class.
  third.firstFunc(); // No output; custom implementation in Third class.
}
