// In this example, the program calculates the factorial of 5 using a recursive function.
// The output, when executed, will be 120 because the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

import 'dart:io';

void main() {
  // Calculate the factorial of 5
  int i = 5;
  final value = findFactorial(i);
  print(value); // Output: 120
}

int findFactorial(int value) {
  // Recursive function to find the factorial
  print('Calculating factorial for $value');

  if (value == 1) {
    return 1;
  }

  int result = value * findFactorial(value - 1);
  print('Factorial for $value: $result');

  return result;
}
