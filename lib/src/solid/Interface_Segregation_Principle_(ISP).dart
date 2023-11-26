/// ******************************************************************************
/// ***                   Theory: Interface Segregation                        ***
/// ******************************************************************************

/// Explanation:that clients (classes) should not be forced to depend on methods they don't use.
///This means that you should not force a client to implement methods that it does not need.
///This can be done by using well-defined interfaces.
///
/// Explanation (Good Practice): In the good practice example, the Worker and Eater
/// interfaces adhere to the Interface Segregation Principle (ISP), which suggests
/// These interfaces are segregated so that classes like Chef can implement only the
/// methods they need, promoting cleaner and more focused implementations.

/// ******************************************************************************

abstract class Worker {
  void work();
}

abstract class Eater {
  void eat();
}

class Programmer implements Worker {
  @override
  void work() {
    // Programming work
  }
}

class Chef implements Worker, Eater {
  @override
  void work() {
    // Cooking work
  }

  @override
  void eat() {
    // Eating behavior
  }
}

/// ******************************************************************************
/// ***                       Bad Example:                                     ***
/// ******************************************************************************

/// In this example, the Worker interface enforces the implementation of both
/// work and eat methods for all classes, even if they don't require one of them,
/// which violates the Interface Segregation Principle (ISP).

abstract class Worker1 {
  void work();

  void eat();
}

/// ******************************************************************************
/// ***                       Bad Example:                                     ***
/// ******************************************************************************
/// The issue here is that robots do not require sleep, making the implementation
/// of the 'sleep' method for the 'Robot' class unclear in the bad example.

abstract class Teacher {
  void work();

  void sleep();
}

class Human implements Teacher {
  void work() => print("I do a lot of work");

  void sleep() => print("I need 10 hours per night...");
}

class Robot implements Teacher {
  void work() => print("I always work");

  void sleep() {} // ??
}

/// ******************************************************************************
/// ***                       Applying After ISP                               ***
/// ******************************************************************************

abstract class Teachers {
  void work();
}

abstract class Sleeper {
  void sleep();
}

class Humans implements Teachers, Sleeper {
  void work() => print("I do a lot of work");

  void sleep() => print("I need 10 hours per night...");
}

class Robots implements Teachers {
  void work() => print("I'm always iiii work as teacher");
}
