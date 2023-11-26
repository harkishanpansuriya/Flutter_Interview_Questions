// void main() {
//   // Initialize a variable 'sum' to store the cumulative sum of numbers.
//   int sum = 0;
//
//   // Define the number up to which we want to calculate the sum.
//   int num = 50;
//
//   // Start a 'for' loop, initializing a loop variable 'i' to 1.
//   // The loop will continue as long as 'i' is less than or equal to 'num'.
//   for (int i = 1; i <= num; ++i) {
//     // In each iteration of the loop, add the current value of 'i' to 'sum'.
//     sum += i;
//   }
//
//   // int i = 1;
//   // while(i<=num){
//   //   sum += i;
//   //   i++;
//   // }
//
//   // Print the final sum to the console.
//   print(sum);
// }


import 'dart:io';

void main(){
  //read number from user
  print('Enter n');
  var n = 5;

  //initialize sum to 0
  var sum = 0;

  for(var i = 1; i <= n; i++) {
    sum += i;
  }

  print('sum = $sum');
}