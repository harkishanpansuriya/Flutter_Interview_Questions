import 'package:flutter/material.dart';
import 'package:flutter_bg/reusable_widget/full_screen_dialog.dart';

class SolidConceptScreen extends StatelessWidget {
  final Map<String, dynamic> items = {
    "Single Responsibility Principle (SRP):": "lib/src/solid/Single_Responsibility_Principle_(SRP).dart",
    "Open/Closed Principle (OCP):": "lib/src/solid/Open_Closed_Principle_(OCP).dart",
    "Liskov Substitution Principle (LSP):": "lib/src/solid/Liskov_Substitution_Principle_(LSP).dart",
    "Interface Segregation Principle (ISP):": "lib/src/solid/Interface_Segregation_Principle_(ISP).dart",
    "Dependency Inversion Principle (DIP):": "lib/src/solid/Dependency_Inversion_Principle_(DIP).dart",
  };

  SolidConceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart SOLID Principles'),
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
