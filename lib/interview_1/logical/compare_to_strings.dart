void main() {
  var str1 = 'apple';
  var str2 = 'banana';
  var result = str1.compareTo(str2);
  if (result < 0) {
    print('"$str1" is less than "$str2".');
  } else if (result > 0) {
    print('"$str1" is greater than "$str2".');
  } else {
    print('"$str1" is equal to "$str2".');
  }
}