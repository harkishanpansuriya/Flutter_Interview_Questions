/// Explanation: Objects of a superclass should be replaceable with objects of its subclasses
/// without affecting the correctness of the program.
/// This means that a subclass should be able to behave like its superclass in all cases.

/// ******************************************************************************
/// ***                         Good Practice                                  ***
/// ******************************************************************************

/// Explanation (Good Practice): In the good practice example, both the Sparrow and
/// Penguin subclasses of Bird adhere to the principle that subclasses should behave
/// consistently with their parent class. Even though penguins can't fly, they don't
/// break the contract defined by the parent class.

/// ******************************************************************************

abstract class OfflineResult {
  checkResult();
}

abstract class CodingResult {
  codingTestResult();
}

class MechanicalBranch implements OfflineResult {
  @override
  checkResult() {
    //  some code
  }
}

class ComputerScienceBranch implements OfflineResult, CodingResult {
  @override
  checkResult() {
    // somecode
  }

  @override
  codingTestResult() {
    // somecode
  }
}

/// ******************************************************************************
/// ***                      Bad Practice                                    ***
/// ******************************************************************************

/// Explanation (Avoid): In the avoid example, the Ostrich subclass of Bird behaves
/// unexpectedly, violating the Liskov Substitution Principle (LSP) by implementing
/// the `fly` method incorrectly.

/// ******************************************************************************

abstract class Result {
  checkResult();

  codingTestResult();
}

class MechanicalBranch2 extends Result {
  @override
  checkResult() {
    //  some code
  }

  /*
  * Here it  is logically incorrect
  * */
  @override
  codingTestResult() {
    //  some code
  }
}

class ComputerScienceBranch2 extends Result {
  @override
  checkResult() {
    //  some codet
  }

  @override
  codingTestResult() {
    //  some code
  }
}
