
/// Explanation: High-level modules should not depend on low-level modules. Instead,
/// both should depend on abstractions.
/// This means that you should not depend on concrete implementations, but rather on abstract interfaces.
///
/// ******************************************************************************
/// ***                   Good Practice:                                       ***
/// ******************************************************************************
/// In the good practice example, the high-level DataManager class adheres to the
/// Dependency Inversion Principle by depending on the abstract DataSource. This
/// design enables DataManager to work seamlessly with various data sources such
/// as RemoteDataSource or LocalDataSource, promoting flexibility and maintainability.

abstract class DataSource {
  String fetchData();
}

class RemoteDataSource implements DataSource {
  @override
  String fetchData() {
    // Fetch data from remote source
    return "data";
  }
}

class LocalDataSource implements DataSource {
  @override
  String fetchData() {
    // Fetch data from local source
    return "data";
  }
}

class DataManager {
  final DataSource _dataSource;

  DataManager(this._dataSource);

  String getData() {
    return _dataSource.fetchData();
  }
}

/// ******************************************************************************
/// ***                   Bad Practice:                                       ***
/// ******************************************************************************
/// In the avoid example, the DataManager class exhibits poor design by tightly coupling
/// itself to specific data sources like fetchDataFromRemote and fetchDataFromLocal.
/// This tight coupling violates the Dependency Inversion Principle (DIP) and reduces
/// flexibility, making it challenging to adapt to different data sources.

class DataManager1 {
  String fetchDataFromRemote() {
    // Fetch data from remote source directly
    return "data";
  }

  String fetchDataFromLocal() {
    // Fetch data from local source directly
    return "data";
  }
}
