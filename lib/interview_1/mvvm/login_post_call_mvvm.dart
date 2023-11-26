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

class LoginViewModel {
  bool isLoading = false;

  Future<UserModel?> loginUser(String email, String password) async {
    isLoading = true;
    // Notify listeners that the loading state has changed.
    notifyListeners();

    final url = Uri.parse('https://reqres.in/api/login');
    final body = jsonEncode({"email": email, "password": password});
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    isLoading = false;
    // Notify listeners that the loading state has changed.
    notifyListeners();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      return null;
    }
  }

  // Add a listener mechanism
  final VoidCallback notifyListeners;

  LoginViewModel({required this.notifyListeners});
}

class LoginApiCallUsingMVVM extends StatelessWidget {
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
  late final LoginViewModel _viewModel;
  String result = '';

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel(notifyListeners: () {
      if (mounted) {
        setState(() {});
      }
    });
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
            onPressed: _viewModel.isLoading
                ? null
                : () async {
                    final email = emailController.text;
                    final password = passwordController.text;
                    final user = await _viewModel.loginUser(email, password);

                    if (user != null) {
                      setState(() {
                        result = 'Token: ${user.token}';
                      });
                    } else {
                      setState(() {
                        result = 'Login failed';
                      });
                    }
                  },
            child: _viewModel.isLoading
                ? CircularProgressIndicator()
                : Text('Login'),
          ),
          Text(result, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
