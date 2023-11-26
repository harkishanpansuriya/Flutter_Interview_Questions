import 'package:flutter/material.dart';
import 'package:flutter_bg/reusable_widget/code_viewer.dart';

class FullScreenDialog extends StatelessWidget {
  FullScreenDialog({
    super.key,
    required this.filePath,
    required this.title,
  });

  String filePath;
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomCodeViewWidget(
        filePath: filePath,
      ), // Replace with your CustomCodeViewWidget
    );
  }
}
