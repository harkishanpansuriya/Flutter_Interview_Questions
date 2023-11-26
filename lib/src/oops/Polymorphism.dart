// Polymorphism Example with Animals and Sounds

// Define a base class 'Animal' with a method 'makeSound'.
class Animal {
  void makeSound() {
    print("Animal makes a generic sound.");
  }
}

// Create a subclass 'Dog' without implementing 'makeSound.'
class Dog extends Animal {
  // 'makeSound' method is not implemented here
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows: Meow meow!");
  }
}

class Cow extends Animal {
  @override
  void makeSound() {
    print("Cow moos: Moo moo!");
  }
}

void main() {
  // Create a list of 'Animal' objects, which can hold objects of any subclass.
  List<Animal> animals = [
    Dog(), // A Dog object
    Cat(), // A Cat object
    Cow(), // A Cow object
  ];

  // Iterate through the list and call 'makeSound' on each object.
  for (var animal in animals) {
    // Polymorphism: Regardless of the actual object type (Dog, Cat, or Cow),
    // the correct 'makeSound' method is called based on the object's type.
    animal.makeSound();
  }
}

/*
OutPut:

Animal makes a generic sound.
Cat meows: Meow meow!
Cow moos: Moo moo!

*/
