// Define an interface (abstract class)
abstract class Animal {
  void makeSound();
}

// Implementing classes must provide the 'makeSound' method
class Dog implements Animal {
  @override
  void makeSound() {
    print("Dog barks: Woof woof!");
  }
}

class Cat implements Animal {
  @override
  void makeSound() {
    print("Cat meows: Meow meow!");
  }
}

void main() {
  // Creating instances of implementing classes
  var dog = Dog();
  var cat = Cat();

  // Calling the 'makeSound' method on instances
  dog.makeSound(); // Output: Dog barks: Woof woof!
  cat.makeSound(); // Output: Cat meows: Meow meow!
}
