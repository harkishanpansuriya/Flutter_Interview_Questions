import 'package:flutter/material.dart';
import 'package:flutter_bg/extension.dart';

class UseFulLinkScreen extends StatelessWidget {
  final List<Map<String, String>> usefulLinks = [
    {
      'title': 'dart-tutorial.com',
      'url': 'https://dart-tutorial.com',
    },
    {
      'title': 'Tutorial Kart',
      'url': 'https://www.tutorialkart.com/dart/',
    },
    {
      'title': 'ProtoCoders Point',
      'url': 'https://protocoderspoint.com/category/dart/',
    },
    {
      'title': 'Zet Code',
      'url': 'https://zetcode.com/all/#dart',
    },
    {
      'title': 'dart-cheat-sheet',
      'url': 'https://github.com/Temidtech/dart-cheat-sheet',
    },
    {
      'title': 'dart-cheat-sheet-pdf',
      'url':
          'https://koenig-media.raywenderlich.com/uploads/2019/08/RW-Dart-Cheatsheet-1.0.2.pdf',
    },
    {
      'title': 'flutter-tips-and-tricks',
      'url': 'https://github.com/vandadnp/flutter-tips-and-tricks/tree/main',
    },
    {
      'title': 'flutter-tips-and-tricks-2',
      'url': 'https://github.com/bizz84/flutter-tips-and-tricks/tree/main',
    },
  ];

  UseFulLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Useful Links'),
      ),
      body: ListView.builder(
        itemCount: usefulLinks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            // Add shadow to the card
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            // Add margins for spacing
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              // Add padding inside ListTile
              title: Text(
                usefulLinks[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Icons.link,
                color: Colors.blue,
              ),
              onTap: () async {
                String? url = usefulLinks[index]['url'];
                await Uri.parse(url!).launchInBrowser();
              },
            ),
          );
        },
      ),
    );
  }
}
