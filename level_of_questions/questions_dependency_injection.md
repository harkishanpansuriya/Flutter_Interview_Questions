### Dependency Injection (DI) in Flutter

---

#### What is a Dependency?

A **dependency** is an object or class that another class needs to function correctly.  
For example, if you have a class to fetch data from a website, this class might rely on a service or
repository to access the data. These services or repositories are the **dependencies** of your
class.

In Flutter, dependencies can include:

- Flutter packages
- Third-party libraries
- Custom classes within your project

---

#### What is Dependency Injection?

**Dependency Injection (DI)** is a way to make your code more flexible and modular. Instead of a
class creating its own dependencies, DI **supplies** them from the outside. This makes the code
easier to manage and test.

This approach has several benefits:

- **Maintainability**: Easier to modify code.
- **Testability**: Simplifies testing by mocking dependencies.

In Flutter, DI is implemented by **injecting dependencies** into a class via:

1. **Constructor Injection**
2. **Method Injection**
3. **Field Injection**

---

### Why Use Dependency Injection in Flutter?

---

#### 1. Simplified Maintenance (Loose Coupling)

Without DI (Tight Coupling):

- Classes are tightly tied to specific implementations.
- Changes in dependencies lead to cascading changes in the code.

**Code Example Without DI**:

```dart
class LocalStorage {
  Future<String> read(String key) async {
    return Future.delayed(Duration(milliseconds: 200), () => 'John Doe');
  }
}

class UserService {
  final LocalStorage storage;

  UserService(this.storage);

  Future<String> getUserName() async {
    return await storage.read('user_name');
  }
}

void main() async {
  final storage = LocalStorage();
  final userService = UserService(storage);

  final userName = await userService.getUserName();
  print('User Name: $userName');
}
```

---

With DI (Loose Coupling):

- Dependencies are provided via interfaces or abstraction.
- The implementation can be easily swapped (e.g., Mock Storage for tests).

**Code Example With DI**:

```dart
abstract class DataStorage {
  Future<String> read(String key);
}

class LocalStorage implements DataStorage {
  @override
  Future<String> read(String key) async {
    return Future.delayed(Duration(milliseconds: 500), () => 'Alice');
  }
}

class MockDataStorage implements DataStorage {
  @override
  Future<String> read(String key) async {
    return 'Test User'; // Simulated test data
  }
}

class UserService {
  final DataStorage storage;

  UserService(this.storage);

  Future<String> getUserName() async {
    return await storage.read('user_name');
  }
}

void main() async {
  // Real usage
  final realStorage = LocalStorage();
  final userService = UserService(realStorage);
  print(await userService.getUserName()); // Output: Alice

  // Test usage
  final testStorage = MockDataStorage();
  final testUserService = UserService(testStorage);
  print(await testUserService.getUserName()); // Output: Test User
}
```

---

#### 2. Effortless Unit Testing

Without DI:  
Testing is cumbersome since dependencies (like APIs or databases) must be mocked or manipulated
manually.

**Code Example Without DI**:

```dart
class NetworkService {
  final HttpClient client;

  NetworkService(this.client);

  Future<User> fetchUser(int userId) async {
    final response = await client.get(Uri.parse('https://api.example.com/users/$userId'));
    return User.fromJson(jsonDecode(response.body));
  }
}
```

With DI:  
By injecting dependencies, testing becomes easier and isolated.

**Code Example With DI**:

```dart
abstract class HttpService {
  Future<Response> get(Uri url);
}

class HttpClientAdapter implements HttpService {
  final HttpClient client;

  HttpClientAdapter(this.client);

  @override
  Future<Response> get(Uri url) async {
    return client.get(url);
  }
}

class MockHttpService implements HttpService {
  @override
  Future<Response> get(Uri url) async {
    return Response(200, jsonEncode({'id': 1, 'name': 'Alice'}));
  }
}

class NetworkService {
  final HttpService client;

  NetworkService(this.client);

  Future<User> fetchUser(int userId) async {
    final response = await client.get(Uri.parse('https://api.example.com/users/$userId'));
    return User.fromJson(jsonDecode(response.body));
  }
}

void main() async {
  // Testing with mock service
  final mockService = MockHttpService();
  final networkService = NetworkService(mockService);

  final user = await networkService.fetchUser(1);
  print(user.name); // Output: Alice
}
```

---

### Types of Dependency Injection

---

#### 1. Constructor Injection

- Dependencies are passed via the constructor.
- Preferred method for DI because it clearly declares dependencies.

**Example**:

```dart
class UserRepository {
  final ApiClient apiClient;

  UserRepository(this.apiClient);
}

class UserBloc {
  final UserRepository userRepository;

  UserBloc(this.userRepository);
}

void main() {
  final apiClient = ApiClient();
  final userRepository = UserRepository(apiClient);
  final userBloc = UserBloc(userRepository);
}
```

---

#### 2. Method Injection

- Dependencies are passed via a method, often a setter.

**Example**:

```dart
class UserBloc {
  late UserRepository userRepository;

  void setUserRepository(UserRepository repository) {
    userRepository = repository;
  }
}

void main() {
  final apiClient = ApiClient();
  final userRepository = UserRepository(apiClient);

  final userBloc = UserBloc();
  userBloc.setUserRepository(userRepository);
}
```

---

#### 3. Field Injection

- Dependencies are assigned directly to class fields.
- Less preferred as it can make testing harder.

**Example**:

```dart
class UserBloc {
  late UserRepository userRepository;
}

void main() {
  final apiClient = ApiClient();
  final userRepository = UserRepository(apiClient);

  final userBloc = UserBloc();
  userBloc.userRepository = userRepository;
}
```

---

### Dependency Injection with GetIt

---

#### What is GetIt?

**GetIt** is a service locator package for managing DI in Flutter.

- It allows you to register dependencies (singletons or factories) centrally.
- These dependencies can then be accessed anywhere in your app.

---

#### Example:

**Problem**: Each screen creates its own `ApiService` object, leading to redundancy.

```
Screen1: ApiService apiService = ApiService();
Screen2: ApiService apiService = ApiService();
```

**Solution**: Use GetIt to register a single `ApiService` instance.

```
GetIt.instance.registerSingleton<ApiService>(ApiService());

// Access it anywhere:
final data = GetIt.instance<ApiService>().getData();
```

---

#### Registration Types

1. **Singleton**: Single instance shared across the app.
   ```
   GetIt.I.registerSingleton<LoginService>(LoginService());
   ```

2. **Lazy Singleton**: Instance is created only when needed.
   ```
   GetIt.I.registerLazySingleton<Validator>(() => Validator());
   ```

3. **Factory**: New instance is created every time.
   ```
   GetIt.instance.registerFactory<NetworkCallService>(() => NetworkCallService());
   ```

---

### Conclusion

Dependency Injection improves **code maintainability** and **testability** by decoupling
dependencies.  
Use DI frameworks like **GetIt** in Flutter for a simple and scalable approach. Choose the injection
type that best fits your project needs.