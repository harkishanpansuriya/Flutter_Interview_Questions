import 'package:flutter/material.dart';
import 'package:flutter_bg/reusable_widget/full_screen_dialog.dart';

class DartDeepDiveScreenMain extends StatelessWidget {
  final Map<String, dynamic> items = {
    "Variable Types and it's sizes": "lib/dart_deep_dive/variables_types.dart",
    "data types": "lib/dart_deep_dive/data_types.dart",
    "Comment types": "lib/dart_deep_dive/comment_types.dart",
    "operators types": "lib/dart_deep_dive/operators.MD",
  };

  DartDeepDiveScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Deep Dive Topics'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final itemKey = items.keys.elementAt(index);
          return buildListItem(context, itemKey, index);
        },
      ),
    );
  }

  Widget buildListItem(BuildContext context, String itemKey, int index) {
    return Card(
      elevation: 1, // Add elevation for a shadow effect
      margin: const EdgeInsets.all(8), // Add margin to the card
      child: ListTile(
        title: Text(
          itemKey,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward), // Add a trailing arrow icon
        onTap: () {
          _handleItemClick(context, index);
        },
      ),
    );
  }

  void _handleItemClick(BuildContext context, int index) async {
    final itemValues = items.values.elementAt(index);
    final itemKey = items.keys.elementAt(index);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenDialog(
          filePath: itemValues,
          title: itemKey,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
