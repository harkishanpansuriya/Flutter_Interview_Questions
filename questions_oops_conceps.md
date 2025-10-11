# 🎨 Object-Oriented Programming (OOPS) Concepts 🚀

## 1. Classes and Objects:

- **Class:**
    - A class is a blueprint for creating objects.
    - A class is a collection of constructors, fields, getters, setters, and methods (functions).
- **Object:** An object is an instance of a class. It is used to store data in the class's fields
  and access its methods and properties.

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

- One class can inherit from another class using the extends keyword in Dart.

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

- Abstraction is the process of hiding implementation details and showing only the essential
  features of an object.
- An abstract class is defined using the `abstract` keyword and cannot be instantiated directly.
- You cannot create objects of an abstract class, but it can be extended by other classes.
- Abstract classes are typically used as a base class to define common behaviors that can be
  inherited and implemented by subclasses.
- An abstract class can have:
    - Abstract methods: Methods without implementation, which must be implemented by subclasses.
    - Concrete methods: Methods with an implementation that can be used as-is or overridden.

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

Here's the explanation in Markdown format:

## 4. Polymorphism:

- **Polymorphism** allows a subclass to **modify** or **replace** a method from the parent class.
- This means the **same method name** can behave differently in different classes.
- It enables us to write **more flexible** and **reusable code**.
- In short, **subclasses can override** the behavior of the parent class.

    - **Method Overriding**: The subclass provides its own implementation of a method that is
      already defined in the parent class.
    - **Method Overloading** (not directly supported in Dart): In languages like Java, it allows
      creating multiple methods with the same name but different parameters. Dart doesn’t support
      method overloading directly, but you can simulate it with optional parameters.

### Example of **Method Overriding**:

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
````

### Example of **Simulating Method Overloading** in Dart:

Since Dart doesn’t support **method overloading** directly, we can use **optional parameters** to
achieve similar behavior.

```dart
class Calculator {
  // Method with optional parameters
  int add(int a, [int b = 0]) {
    return a + b;
  }
}

void main() {
  Calculator calc = Calculator();

  print(calc.add(5)); // Output: 5
  print(calc.add(5, 3)); // Output: 8
}
```

### Key Concepts:

* **Overriding**: Subclasses change the behavior of a parent class method.
* **Overloading**: Multiple methods with the same name but different parameters (simulated in Dart
  with optional parameters).

## 5. Encapsulation:

- **Encapsulation** is the concept of bundling data (fields) and methods within a class, while
  hiding the internal implementation details from outside the class.
- It ensures that the internal workings of a class are protected, and you can only interact with the
  class's data through its **public methods** (getters and setters).

### How to Achieve Encapsulation in Dart?

- Encapsulation is achieved by:
    - **Private fields** (using `_` to prefix the field name) to restrict direct access to data.
    - **Getter methods** to access the value of private properties.
    - **Setter methods** to update the value of private properties.

### Example:

```dart
class Student {
  String _name; // Private property

  // Getter method to access the private property
  String get name => _name;

  // Setter method to update the private property
  set name(String name) {
    _name = name;
  }
}

void main() {
  Student student = Student();
  student.name = "Alice"; // Using setter to set the value
  print(student.name);    // Using getter to retrieve the value
}
