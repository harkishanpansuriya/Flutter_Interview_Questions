import 'package:flutter/material.dart';

class CounterModel {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }

  void decrement() {
    _count--;
  }
}

class CounterController {
  final CounterModel model;

  CounterController(this.model);

  void increment() {
    model.increment();
  }

  void decrement() {
    model.decrement();
  }
}

class CounterAppUsingMvc extends StatefulWidget {
  @override
  _CounterAppUsingMvcState createState() => _CounterAppUsingMvcState();
}

class _CounterAppUsingMvcState extends State<CounterAppUsingMvc> {
  final CounterModel model = CounterModel();
  late final CounterController controller;

  @override
  void initState() {
    super.initState();
    controller = CounterController(model);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App (MVC)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Counter Value:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${model.count}',
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.increment();
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.decrement();
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
