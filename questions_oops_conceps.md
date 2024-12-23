# 🎨 Object-Oriented Programming (OOPS) Concepts 🚀

## 1. Classes and Objects:

- **Class:** A class is a blueprint for creating objects. It is a collection of data methods and
  functions, which includes fields, getters, setters, constructors, and functions.
- **Object:** An object is an instance of a class. It is used to access the class's properties.

### Example:

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void display() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  Person person = Person("John", 25);
  person.display();
}
```

## 2. Inheritance:

- In Dart, you can create a new class based on an existing one by using the `extends` keyword. This
  process is known as inheritance, where one class inherits the properties and methods of another
  class.
- Simply put, one class can inherit another class. We make use of the `extends` keyword to do so.

### Example:

```dart
class Parent {
  void display() {
    print("This is the Parent class");
  }
}

class Child extends Parent {
  void show() {
    print("This is the Child class");
  }
}

void main() {
  Child child = Child();
  child.display(); // This is the Parent class
  child.show(); // This is the Child class
}
```

### Types of Inheritance:

1. **Single Inheritance:** A class can inherit from only one class in Dart. We can extend one class
   at a time.
   ```dart
   class Child extends Parent {}
   ```

2. **Multiple Inheritance:** Dart doesn't support multiple inheritance, which means a class cannot
   extend more than one class.
   ```dart
   // class Child extends Parent, SecondParent {} // This is not allowed in Dart.
   ```

3. **Multilevel Inheritance:** A class can inherit from another class, and that class can also
   inherit from another class.
    - **Example:**
        - `Animal` is the base class.
        - `Mammal` inherits from `Animal`.
        - `Dog` inherits from `Mammal`.

4. **Hierarchical Inheritance:** Multiple subclasses inherit from a single parent class. This allows
   subclasses to share the properties and methods of their parent class while also adding their own
   unique features.
    - **Example:**
        - `Cat` and `Dog` are both derived classes from the common parent class `Animal`.
        - Both `Cat` and `Dog` inherit the `eat()` method from the `Animal` class.
        - `Cat` has its own method `meow()`, and `Dog` has its own method `bark()`.

## 3. Abstraction:

- Abstract classes are classes that cannot be instantiated. They are used to define the behavior of
  the class that can be inherited by another class. An abstract class is declared using
  the `abstract` keyword.
- Abstract class objects cannot be created but can be extended.
- Abstract classes can contain abstract methods (without implementation) and concrete methods (with
  implementation).

### Example:

```dart
abstract class Animal {
  void eat(); // Abstract method

  void breathe() {
    print("Breathing");
  }
}

class Dog extends Animal {
  void eat() {
    print("Dog is eating");
  }
}

void main() {
  Dog dog = Dog();
  dog.eat(); // Dog is eating
  dog.breathe(); // Breathing
}
```

## 4. Polymorphism:

- Polymorphism is updating or modifying a feature, function, or implementation that already exists
  in the parent class.
- A subclass can override the behavior of the parent class.

### Example:

```dart
class Animal {
  void sound() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog barks");
  }
}

void main() {
  Animal animal = Animal();
  animal.sound(); // Animal makes a sound

  Dog dog = Dog();
  dog.sound(); // Dog barks
}
```

## 5. Encapsulation:

- Encapsulation is the concept of bundling data and methods within a class, hiding the internal
  implementation details from outside the class.

### How to Achieve Encapsulation in Dart?

- Providing public getter and setter methods to access and update the value of private property.
- Getter methods are used to access the value of private property. Setter methods are used to update
  the value of private property.

### Example:

```dart
class Student {
  String _name; // Private property

  String get name => _name; // Getter method

  set name(String name) {
    _name = name; // Setter method
  }
}

void main() {
  Student student = Student();
  student.name = "Alice"; // Using setter
  print(student.name); // Using getter
}
```
