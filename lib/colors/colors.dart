import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  final List<Color> randomColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
    Colors.deepOrange,
    Colors.cyan,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lime,
    Colors.pink,
    Colors.brown,
    Colors.grey,
  ];

  Color getRandomColor() {
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  Color get randomColor => getRandomColor(); // Convenience method
}
