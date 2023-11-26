// bool isPrime(int number) {
//   if (number <= 1) {
//     return false; // 0 and 1 are not prime numbers
//   }
//
//   for (int i = 2; i <= number / 2; i++) {
//     if (number % i == 0) {
//       return false; // If the number is divisible by any number from 2 to number/2, it's not prime
//     }
//   }
//
//   return true; // If the loop completes without finding a divisor, the number is prime
// }
//
// void main() {
//   int num = 4; // Change this to the number you want to check for primality
//
//   if (isPrime(num)) {
//     print("$num is a prime number.");
//   } else {
//     print("$num is not a prime number.");
//   }
// }

bool isPrimeUsingForLoop(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= number / i; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

bool isPrimeUsingWhileLoop(int number) {
  if (number <= 1) {
    return false;
  }

  int i = 2;
  while (i <= number / i) {
    if (number % i == 0) {
      return false;
    }
    i++;
  }
  return true;
}


void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<int> primeNumbers = [];
  List<int> nonPrimeNumbers = [];

  for (int number in numbers) {
    if (isPrimeUsingWhileLoop(number)) {
      primeNumbers.add(number);
    } else {
      nonPrimeNumbers.add(number);
    }
  }

  print("Prime numbers: $primeNumbers");
  print("Non-prime numbers: $nonPrimeNumbers");
}
