/// ******************************************************************************
/// ***                  Classes                                           ***
/// ******************************************************************************
/// Classes serve as user-defined data types, defining blueprints for objects,
/// their attributes, and methods.
///
/// temporary below:
/// A class is a blueprint for creating objects.
/// A class defines the properties and methods that an object will have.

/// ******************************************************************************
/// ***                  object                                           ***
/// ******************************************************************************
/// An object is an instance of a class, representing a unique entity with its own
/// data and behavior.
/// An object is an instance of a class. You can create multiple objects of the same class.

class ElectronicDevice {
  String name;
  String type;

  ElectronicDevice(this.name, this.type);

  void turnOn() {
    print("$name is turned on.");
  }

  void turnOff() {
    print("$name is turned off.");
  }
}

void main() {
  var smartphone = ElectronicDevice("Smartphone", "Mobile Device");
  smartphone.turnOn();
  smartphone.turnOff();

  var laptop = ElectronicDevice("Laptop", "Computer");
  laptop.turnOn();
  laptop.turnOff();
}
