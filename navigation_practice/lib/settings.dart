import 'package:flutter/material.dart';
import 'package:navigation_practice/abbout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            ),
          },
      child: const Text('About'),
    );
  }
}
