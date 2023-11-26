import 'dart:io';

void main(){

  int i = 5;
  final value = findFactorial(i);
  print(value);
}

int findFactorial(int value){

  if(value == 1){
    return 1;
  }
  return value * findFactorial(value - 1);
}