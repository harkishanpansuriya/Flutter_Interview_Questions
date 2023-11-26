import 'package:flutter/material.dart';
import 'package:flutter_bg/reusable_widget/full_screen_dialog.dart';

class OOPSConceptScreen extends StatelessWidget {
  final Map<String, dynamic> items = {
    "Classes and Objects": "lib/src/oops/classes_objects.dart",
    "Encapsulation": "lib/src/oops/Encapsulation.dart",
    "Inheritance": "lib/src/oops/Inheritance.dart",
    "Polymorphism": "lib/src/oops/Polymorphism.dart",
    "Abstraction": "lib/src/oops/Abstraction.dart",
    "mixin": "lib/src/oops/mixin.dart",
    "interface": "lib/src/oops/interface.dart",
  };

  OOPSConceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OOPS Concepts'),
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
