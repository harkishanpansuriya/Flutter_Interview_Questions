import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bg/interview_1/model/usermodel.dart';
import 'package:http/http.dart' as http;

class UserApiCallUsingMvvm extends StatefulWidget {
  const UserApiCallUsingMvvm({Key? key}) : super(key: key);

  @override
  State<UserApiCallUsingMvvm> createState() => _UserApiCallUsingMvvmState();
}

class _UserApiCallUsingMvvmState extends State<UserApiCallUsingMvvm> {
  final UserModelViewModel _userModelViewModel = UserModelViewModel();

  @override
  void initState() {
    super.initState();
    _userModelViewModel.getData(); // Load data when the widget initializes.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<List<UserModel>>(
          stream: _userModelViewModel.userModelStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data'));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final userModel = snapshot.data![index];
                  return ListTile(
                    title: Text(userModel.title!),
                    subtitle: Text(userModel.completed!.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class UserModelViewModel {
  final _userModelStreamController = StreamController<List<UserModel>>();

  Stream<List<UserModel>> get userModelStream =>
      _userModelStreamController.stream;

  void getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
      final List<UserModel> userList = jsonData
          .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
          .toList();
      _userModelStreamController.sink.add(userList);
    } else {
      _userModelStreamController.sink.addError('Failed to fetch data');
    }
  }

  void dispose() {
    _userModelStreamController.close();
  }
}
