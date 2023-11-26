void main() {
  String value = "harkishan";

  value.runes.forEach((element) {
    var character = String.fromCharCode(element);
    print(character);
  });
}
