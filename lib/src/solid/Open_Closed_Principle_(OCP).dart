/// ******************************************************************************
/// ***                       The Open/Closed Principle                        ***
/// ******************************************************************************
///
/// A class should be open for extension but closed for modification.
/// This means that you should be able to add new features to a class without modifying the existing code.
/// This can be done by using interfaces and abstract classes.

/// The Open/Closed Principle suggests that software entities (classes, modules,
/// functions) should be open for extension but closed for modification. In Flutter
/// development, this principle promotes the use of inheritance and composition to
/// add new features without altering existing code.

/// ******************************************************************************
/// ***                          Bad Practice Example                           ***
/// ******************************************************************************

class ExamResult
{
  mechanicalCheckResult()
  {
    // some code
  }

  civilCheckResult()
  {
    // some code
  }

}

/// ******************************************************************************
/// ***                       Applying the Open-Closed Principle                ***
/// ******************************************************************************

abstract class ExamResultGood {
  checkResult();
}

class ComputerScience implements ExamResultGood {
  @override
  checkResult() {
    // some code
  }
}

class Civil implements ExamResultGood {
  @override
  checkResult() {
    // some code
  }
}

class Mechanical implements ExamResultGood {
  @override
  checkResult() {
    // some code
  }
}