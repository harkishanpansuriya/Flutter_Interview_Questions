import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserModel {
  final String token;

  UserModel({required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token']);
  }
}

class LoginModel {
  Future<UserModel?> loginUser(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/login');
    final body = jsonEncode({"email": email, "password": password});
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      return null;
    }
  }
}

class LoginController {
  final LoginModel model;
  bool isLoading = false;

  Future<UserModel?> login(String email, String password) async {
    isLoading = true;
    // Notify the view about the loading state.
    notifyListeners();

    final user = await model.loginUser(email, password);

    isLoading = false;
    // Notify the view about the loading state.
    notifyListeners();

    return user;
  }

  // Add a listener mechanism
  final VoidCallback notifyListeners;

  LoginController({required this.model, required this.notifyListeners});
}

class LoginApiCallUsingMVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Example'),
        ),
        body: LoginView(),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final LoginController _controller;
  String result = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(
        model: LoginModel(),
        notifyListeners: () {
          if (mounted) {
            setState(() {});
          }
         });
  }

  void _updateLoadingState(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  Future<void> _handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;
    _updateLoadingState(true);
    final user = await _controller.login(email, password);
    _updateLoadingState(false);

    if (user != null) {
      setState(() {
        result = 'Token: ${user.token}';
      });
    } else {
      setState(() {
        result = 'Login failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: isLoading ? null : _handleLogin,
            child: isLoading ? CircularProgressIndicator() : Text('Login'),
          ),
          Text(result, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
