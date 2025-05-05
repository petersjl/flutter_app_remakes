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

class ColorListPage extends StatefulWidget {
  const ColorListPage({super.key});

  @override
  State<ColorListPage> createState() => _ColorListPageState();
}

class _ColorListPageState extends State<ColorListPage> {
  Color seedColor = Colors.deepPurple;

  void _updateSeedColor(String hexCode) {
    try {
      final newColor = Color(int.parse(hexCode, radix: 16) | 0xFF000000);
      setState(() {
        seedColor = newColor;
      });
    } catch (e) {
      // Handle invalid hex code
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid hex code!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor)).colorScheme;
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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final hexCode = await showDialog<String>(
                context: context,
                builder: (context) {
                  String input = '';
                  return AlertDialog(
                    title: const Text('Enter Hex Code'),
                    content: TextField(
                      onChanged: (value) => input = value,
                      decoration: const InputDecoration(hintText: 'e.g., FF5733'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(input),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
              if (hexCode != null) {
                _updateSeedColor(hexCode);
              }
            },
          ),
        ],
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
