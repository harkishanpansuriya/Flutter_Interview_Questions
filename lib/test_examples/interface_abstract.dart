// Abstract class
abstract class Shape {
  void draw();
}

// Interface
abstract class Drawable {
  void draw();
}

// Concrete class
class Circle extends Shape implements Drawable {
  @override
  void draw() {
    print('Drawing a circle');
  }
}

// Concrete class
class Rectangle extends Shape implements Drawable {
  @override
  void draw() {
    print('Drawing a rectangle');
  }
}

// Main function
void main() {
  // Create a list of drawable shapes
  List<Drawable> shapes = [
    Circle(),
    Rectangle(),
  ];

  // Draw all the shapes
  for (var shape in shapes) {
    shape.draw();
  }
}

class Person {
  String firstName;
  String lastName;

  // constructor
  Person(this.firstName, this.lastName);

  // factory constructor Person.fromMap
  factory Person.fromMap(Map<String, Object> map) {
    final firstName = map['firstName'] as String;
    final lastName = map['lastName'] as String; 
    return Person(firstName, lastName);
  }
}
