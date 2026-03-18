# 🎨 Object-Oriented Programming (OOPS) Concepts 🚀

## https://dart-tutorial.com/object-oriented-programming/polymorphism-in-dart/

## 1. Classes and Objects:

- **Class:**
    - A class is a blueprint for creating objects.
    - A class can contain constructors, variables, getters, setters, and methods.
- **Object:** An object is an instance of a class. It is used to store data and access class methods.

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
- Inheritance allows one class to reuse properties and methods of another class using extends.

### Example:

```dart
class Car {
  String brand;
  int speed;

  Car(this.brand, this.speed);

  void drive() {
    print("$brand is driving at $speed km/h");
  }
}

void main() {
  Car myCar = Car("Tesla", 120);
  myCar.drive(); // Tesla is driving at 120 km/h
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
   // class Child extends Parent, SecondParent {} // not allowed in Dart.
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
- You cannot create objects of an abstract class, but it can be extended (inherited) by other classes.
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

## 4. Polymorphism

- Polymorphism means "one interface, multiple implementations".
- Polymorphism means one method behaves differently depending on the object type.
- It allows same method name, different behavior.

### Types of Polymorphism

#### 1. Method Overriding (Supported in Dart)

- Child class gives its own implementation of parent method.
- This is runtime polymorphism.

**Example:**

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
  Animal obj = Dog();
  obj.sound(); // Dog barks
}
````


#### 2. Method Overloading (Not supported directly in Dart)

- Dart does NOT support true method overloading.
- We can achieve similar behavior using optional or named parameters.

**Example (Simulated Overloading):**

```dart
class Calculator {
  int add(int a, [int? b, int? c]) {
    if (b != null && c != null) {
      return a + b + c;
    } else if (b != null) {
      return a + b;
    } else {
      return a; // Only one value given
    }
  }
}

void main() {
  Calculator calc = Calculator();

  print(calc.add(5));      // Output: 5
  print(calc.add(5, 10));  // Output: 15
  print(calc.add(5, 10, 3)); // Output: 18
}
```

Here you go, friend. I kept your structure intact but made the wording cleaner, easier, and a bit more complete. Nothing over the top, just smooth and simple.

---

## 5. Encapsulation

* Encapsulation hides class properties to prevent direct access from outside the class.
* Data can be accessed or modified only through getters and setters, ensuring safe and controlled handling.

### How to Achieve Encapsulation in Dart

* In Dart, you use:

  * **Private fields** (adding `_` before the name) to block direct access from other files.
  * **Getters** to read the values of private properties.
  * **Setters** to update private properties, often with validation or custom logic.

### Example

```dart
class BankAccount {
  double _balance = 0;  // Hidden property (private)

  // Getter to read the balance
  double get balance => _balance;

  // Setter to update the balance safely
  set deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }
}

void main() {
  BankAccount acc = BankAccount();

  acc.deposit = 500;     // Using setter
  print(acc.balance);    // Using getter
}
```
