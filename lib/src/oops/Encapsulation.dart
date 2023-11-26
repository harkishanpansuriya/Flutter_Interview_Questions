class Person {
  String _name; // Private attribute
  int _age; // Private attribute

  Person(this._name, this._age);

  // Getter for _name
  String get name => _name;

  // Setter for _name with validation
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  // Getter for _age
  int get age => _age;

  // Method to check if the person is an adult
  bool isAdult() {
    return _age >= 18;
  }
}

void main() {
  var person = Person("Alice", 25);

  // Accessing private attribute using getter
  print("Name: ${person.name}");
  print("Age: ${person.age}");

  // Using setter to update name
  person.name = "Bob"; // This will be accepted

  // Using setter with validation
  person.name = ""; // This won't change the name as it's empty

  // Accessing private method
  print("Is Adult: ${person.isAdult()}");
}
