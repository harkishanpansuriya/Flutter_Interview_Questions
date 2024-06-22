import 'package:flutter/material.dart';
import 'package:flutter_bg/colors/colors.dart';
import 'package:flutter_bg/dart_deep_dive/ui/dart_deep_dive_screen_main.dart';
import 'package:flutter_bg/extension.dart';
import 'package:flutter_bg/interview_1/mvc/counter_app.dart';
import 'package:flutter_bg/solid_principles/ui/solid_screen.dart';
import 'package:flutter_bg/src/oops/ui/oops_screen.dart';
import 'package:flutter_bg/useful_links/useful_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Tour',
      theme: ThemeData().blackTheme, // Use the custom black theme
      // home: DashboardScreen(),
      home: CounterAppUsingMvc(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final AppColors appColors = AppColors();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Tour'),
      ),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2, // 2 columns in the grid
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          DashboardCard(
            title: 'OOPS',
            icon: Icons.code,
            color: appColors.randomColor,
            onTap: () {
              context.navigateToRoute(OOPSConceptScreen());
            },
          ),
          DashboardCard(
            title: 'SOLID',
            icon: Icons.code,
            color: Colors.green,
            onTap: () {
              context.navigateToRoute(SolidConceptScreen());
            },
          ),
          DashboardCard(
            title: 'Dart Deep Dive',
            icon: Icons.code,
            color: Colors.orange,
            onTap: () {
              context.navigateToRoute(DartDeepDiveScreenMain());
            },
          ),
          DashboardCard(
            title: 'UseFul Links',
            icon: Icons.code,
            color: Colors.red,
            onTap: () {
              context.navigateToRoute(UseFulLinkScreen());
            },
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final void Function()? onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 48.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


