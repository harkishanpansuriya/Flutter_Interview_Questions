///
/// Explanation: A class should have only one responsibility.
/// This means that a class should only have one reason to change.
/// If a class has multiple responsibilities,
/// then it becomes difficult to maintain and modify the code.

///
/// ***********************************************
/// ***           Good Practice                 ***
/// ***********************************************
///
/// In this example, the `UserManager` class handles user creation,
/// the `DatabaseService` handles database operations, and the `LoggerService`
/// handles logging.
/// For example, suppose you have a widget responsible for displaying user
/// information and handling user interactions. Instead of combining both
/// functionalities in a single widget, it is better to create separate widgets
/// for displaying information and handling user interactions. This way, you
/// keep the responsibilities distinct and the code more organized.
///
/// In the good practice example, each class has a single, well-defined
/// responsibility. UserManager handles user creation, DatabaseService
/// manages database operations, and LoggerService deals with logging.
///
class UserManager {
  final DatabaseService _database;
  final LoggerService _logger;

  UserManager(this._database, this._logger);

  void createUser(String username, String email) {
    // Create user logic
    _database.saveUser(username, email);
    _logger.log('User created: $username');
  }
}

class DatabaseService {
  void saveUser(String username, String email) {
    // Database logic
  }
}

class LoggerService {
  void log(String message) {
    // Logging logic
  }
}

///
/// ***********************************************
/// ***           BAD Practice                 ***
/// ***********************************************
///
/// In the avoid example, the User class has multiple responsibilities,
/// including user creation, database operations, and logging. This violates
/// the SRP as it doesn't adhere to the principle that each class should have
/// one reason to change.
///

class User {
  String? username;
  String? email;

  void createUser() {
    // Combined user creation, database operations, and logging
  }
}
