/********** Inheritance **********/

// Inheritance allows a subclass to inherit properties and methods from a superclass.
// Here's an example:

class Vehicle {
  String? brand;
  int? year;

  Vehicle(this.brand, this.year);

  void startEngine() {
    print('$brand engine started');
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, int year, this.numberOfDoors) : super(brand, year);

  void honkHorn() {
    print('$brand car is honking the horn');
  }
}

/********** Multilevel Inheritance **********/

// Multilevel inheritance involves creating a chain of classes with each class inheriting from the previous one.
// Here's an example:

class Animal {
  String? species;

  Animal(this.species);

  void makeSound() {
    print('$species makes a sound');
  }
}

class Bird extends Animal {
  Bird(String species) : super(species);

  void fly() {
    print('$species can fly');
  }
}

class Penguin extends Bird {
  Penguin() : super('Penguin');

  void swim() {
    print('$species can swim');
  }
}

/********** Hierarchical Inheritance **********/

// Hierarchical inheritance involves multiple classes inheriting from a common superclass.
// Here's an example:

class Shape {
  double? dimension1;
  double? dimension2;

  Shape(this.dimension1, this.dimension2);

  double area() {
    return dimension1! * dimension2!;
  }
}

class Rectangle extends Shape {
  Rectangle(double length, double width) : super(length, width);

  void display() {
    print('Rectangle: Length=$dimension1, Width=$dimension2, Area=${area()}');
  }
}

class Triangle extends Shape {
  Triangle(double base, double height) : super(base, height);

  void display() {
    print('Triangle: Base=$dimension1, Height=$dimension2, Area=${area()}');
  }
}

void main() {
  /********** Inheritance **********/

  var car = Car('Toyota', 2022, 4);
  car.startEngine();
  car.honkHorn();

  /********** Multilevel Inheritance **********/

  var penguin = Penguin();
  penguin.makeSound();
  penguin.fly();
  penguin.swim();

  /********** Hierarchical Inheritance **********/

  var rectangle = Rectangle(10.0, 5.0);
  var triangle = Triangle(8.0, 6.0);
  rectangle.display();
  triangle.display();
}
