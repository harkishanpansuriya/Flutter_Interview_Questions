void main() {
  var character = 'a'; // Replace 'A' with the character you want to check

  if (character.runes.first >= 'A'.runes.first && character.runes.first <= 'Z'.runes.first ||
      character.runes.first >= 'a'.runes.first && character.runes.first <= 'z'.runes.first) {
    print('$character is an alphabet.');
  } else {
    print('$character is not an alphabet.');
  }
}
