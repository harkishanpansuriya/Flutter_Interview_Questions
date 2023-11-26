/// Abstraction is used to hide background details or any unnecessary
/// implementation about the data so that users only see the required information.
/// It is one of the most important and essential features of object-oriented programming.
/// Pre-defined functions are similar to data abstraction.

/// The abstract keyword is used to declare abstract classes.
/// Methods that are declared but not implemented are known as abstract methods.

import 'dart:math';

abstract class Shape {
  double calculateArea();

  double calculatePerimeter();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * radius * radius;
  }

  @override
  double calculatePerimeter() {
    return 2 * pi * radius;
  }
}

class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() {
    return length * width;
  }

  @override
  double calculatePerimeter() {
    return 2 * (length + width);
  }
}

class Triangle extends Shape {
  double side1;
  double side2;
  double side3;

  Triangle(this.side1, this.side2, this.side3);

  @override
  double calculateArea() {
    double s = (side1 + side2 + side3) / 2;
    return sqrt(s * (s - side1) * (s - side2) * (s - side3));
  }

  @override
  double calculatePerimeter() {
    return side1 + side2 + side3;
  }
}

void main() {
  final circle = Circle(5);
  final rectangle = Rectangle(4, 6);
  final triangle = Triangle(3, 4, 5);

  print(
      'Circle - Area: ${circle.calculateArea()}, Perimeter: ${circle.calculatePerimeter()}');
  print(
      'Rectangle - Area: ${rectangle.calculateArea()}, Perimeter: ${rectangle.calculatePerimeter()}');
  print(
      'Triangle - Area: ${triangle.calculateArea()}, Perimeter: ${triangle.calculatePerimeter()}');
}
