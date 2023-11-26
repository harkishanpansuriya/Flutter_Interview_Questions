import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class CustomCodeViewWidget extends StatelessWidget {
  final String filePath; // Specify the file path you want to use

  const CustomCodeViewWidget({
    super.key,
    required this.filePath,
    // Add other configurable parameters as needed
  });

  @override
  Widget build(BuildContext context) {
    return WidgetWithCodeView(
      filePath: filePath,
      // Use the specified file path here
      // codeContent: '', // You can add code content here if needed
      codeLinkPrefix: 'https://google.com?q=',
      iconBackgroundColor: Colors.white,
      iconForegroundColor: Colors.pink,
      labelBackgroundColor: Theme.of(context).canvasColor,
      labelTextStyle: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      showLabelText: true,
    );
  }
}
