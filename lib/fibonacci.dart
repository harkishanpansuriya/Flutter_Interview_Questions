// Recursive function to calculate the nth Fibonacci number
int fibonacci(int n) {
  // Base case 1: If n is 0, return the first Fibonacci number, which is 0
  if (n == 0) {
    return 0;
  }

  // Base case 2: If n is 1, return the second Fibonacci number, which is 1
  if (n == 1) {
    return 1;
  }

  // Recursive case: For n greater than 1,
  // calculate Fibonacci(n) as the sum of Fibonacci(n-1) and Fibonacci(n-2)
  // The Fibonacci sequence starts with 0 and 1,
  // and each subsequent number is the sum of the two previous numbers.
  int fibNMinus1 = fibonacci(n - 1); // Calculate Fibonacci(n-1)
  int fibNMinus2 = fibonacci(n - 2); // Calculate Fibonacci(n-2)

  // Calculate Fibonacci(n) as the sum of Fibonacci(n-1) and Fibonacci(n-2)
  int fibN = fibNMinus1 + fibNMinus2;

  return fibN; // Return the nth Fibonacci number
}

void main() {
  int n = 6; // Calculate the 6th Fibonacci number
  int result = fibonacci(n);

  print("The $n-th Fibonacci number is $result");
}
