import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Colors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ColorListPage(),
    );
  }
}

class ColorListPage extends StatelessWidget {
  const ColorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final seedColor = Colors.deepPurple;
    final colors = {
      'Primary': colorScheme.primary,
      'On Primary': colorScheme.onPrimary,
      'Primary Container': colorScheme.primaryContainer,
      'On Primary Container': colorScheme.onPrimaryContainer,
      'Secondary': colorScheme.secondary,
      'On Secondary': colorScheme.onSecondary,
      'Secondary Container': colorScheme.secondaryContainer,
      'On Secondary Container': colorScheme.onSecondaryContainer,
      'Tertiary': colorScheme.tertiary,
      'On Tertiary': colorScheme.onTertiary,
      'Tertiary Container': colorScheme.tertiaryContainer,
      'On Tertiary Container': colorScheme.onTertiaryContainer,
      'Error': colorScheme.error,
      'On Error': colorScheme.onError,
      'Error Container': colorScheme.errorContainer,
      'On Error Container': colorScheme.onErrorContainer,
      'Background': colorScheme.background,
      'On Background': colorScheme.onBackground,
      'Surface': colorScheme.surface,
      'On Surface': colorScheme.onSurface,
      'Surface Variant': colorScheme.surfaceVariant,
      'On Surface Variant': colorScheme.onSurfaceVariant,
      'Outline': colorScheme.outline,
      'Shadow': colorScheme.shadow,
      'Inverse Surface': colorScheme.inverseSurface,
      'On Inverse Surface': colorScheme.onInverseSurface,
      'Inverse Primary': colorScheme.inversePrimary,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Colors'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Seed Color'),
            subtitle: Container(
              height: 50,
              color: seedColor,
              child: Center(
                child: Text(
                  '#${seedColor.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ...colors.entries.map((entry) {
            return ListTile(
              title: Text(entry.key),
              subtitle: Container(
                height: 50,
                color: entry.value,
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
