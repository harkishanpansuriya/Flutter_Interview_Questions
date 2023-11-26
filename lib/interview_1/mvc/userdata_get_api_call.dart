import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bg/interview_1/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserModelController {
  final StreamController<List<UserModel>> _userModelStreamController =
      StreamController<List<UserModel>>();

  Stream<List<UserModel>> get userModelStream =>
      _userModelStreamController.stream;

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
      final userModelList = jsonData
          .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
          .toList();
      _userModelStreamController.sink.add(userModelList);
    }
  }

  void dispose() {
    _userModelStreamController.close();
  }
}

class UserApiCallSimple extends StatefulWidget {
  const UserApiCallSimple({Key? key}) : super(key: key);

  @override
  State<UserApiCallSimple> createState() => _UserApiCallSimpleState();
}

class _UserApiCallSimpleState extends State<UserApiCallSimple> {
  final UserModelController _controller = UserModelController();

  @override
  void initState() {
    super.initState();
    _controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<List<UserModel>>(
          stream: _controller.userModelStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data'));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final userModel = snapshot.data![index];
                  return ListTile(
                    title: Text(userModel.title!),
                    subtitle: Text(userModel.completed.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
