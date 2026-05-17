## Name the famous database packages utilized in Flutter? and SqFlite and Comparison with Hive

- The Famous and Most used database packages in Flutter are: Firebase Database, SqFlite database ,
  hive , ObjectBox etc

- **Sqflite:**
    - A lightweight, SQL-based relational database management system (RDBMS) for Flutter.
    - Supports a wide range of SQL features and is suitable for complex applications.

- **Hive:**
    - A lightweight, NoSQL database for Flutter.
    - Offers fast performance and simplicity, ideal for simpler applications or scenarios requiring
      fast data storage and retrieval.

## What is SQLite, and why is it used in Flutter?

- **SQLite:**  
  A lightweight, embedded database **no separate server needed**

- **Use in Flutter:**
    - Provides **local data storage** for offline persistence
    - Commonly used via the `sqflite` package to **interact with the database**


## How do you handle migrations in SQLite with Flutter?

- Migrations are handled using the onUpgrade callback in openDatabase:
  ```dart
  Future<Database> initDB() async {
  String path = join(await getDatabasesPath(), 'my_database.db');
  return await openDatabase(
  path,
  version: 2, // Increment version
  onUpgrade: (db, oldVersion, newVersion) async {
  if (oldVersion < 2) {
  await db.execute("ALTER TABLE users ADD COLUMN email TEXT");
  }
  },
  );
  }
  ```

## How do you check if a table exists in SQLite?

- Future<bool> doesTableExist(Database db, String tableName) async {
  final result = await db.rawQuery(
  "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
  [tableName]
  );
  return result.isNotEmpty;
  }

