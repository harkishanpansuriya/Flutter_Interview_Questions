void main() {
  int a = 1;
  int b = 2;
  print("Original values: A $a B $b");

  int temp = a; // Use a temporary variable to store the value of 'a'
  a = b; // Assign the value of 'b' to 'a'
  b = temp; // Assign the original value of 'a' (stored in 'temp') to 'b'

  print("Swapped values: A $a B $b");
}

/// without temp variable
// void main() {
//   int a = 1;
//   int b = 2;
//   print("Original values: A $a B $b");
//
//   a = a + b; // Add 'a' and 'b' and store the result in 'a'
//   b = a - b; // Subtract the original value of 'b' from the new 'a' to get the original 'a' value, and store it in 'b'
//   a = a - b; // Subtract the new 'b' from the updated 'a' to get the original 'b' value, and store it in 'a'
//
//   print("Swapped values: A $a B $b");
// }
