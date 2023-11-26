// void main() {
//   String character = "A"; // Replace with the character you want to find the ASCII value for
//   int asciiValue = character.codeUnitAt(0);
//   print("ASCII value of $character is $asciiValue");
// }


void main() {
  String character = "A"; // Replace with the character you want to find the ASCII value for
  int asciiValue = character.runes.first;
  print("ASCII value of $character is $asciiValue");
}
