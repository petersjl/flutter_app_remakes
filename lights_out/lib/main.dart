import 'package:flutter/material.dart';
import 'package:lights_out/lights_out_view_model.dart';
import 'package:provider/provider.dart';
import 'package:lights_out/lights_row.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LightsOutViewModel())],
      child: const LightsOutApp(),
    ),
  );
}

class LightsOutApp extends StatelessWidget {
  const LightsOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 128, 0, 0),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LightsOutViewModel>();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Color.fromARGB(255, 128, 0, 0),
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            viewModel.gameWon
                ? 'You won in ${viewModel.clicks} click${viewModel.clicks == 1 ? '' : 's'}!'
                : viewModel.clicks == 0
                ? 'Turn out all the lights'
                : 'Clicks: ${viewModel.clicks}',
          ),
          // Row of lights
          const LightsRow(),
          const SizedBox(
            height: 20,
          ), // Add spacing between the row and the button
          // New Game button
          ElevatedButton(
            onPressed: () {
              viewModel.newGame(); // Call the new game method
            },
            child: const Text('New Game'),
          ),
        ],
      ),
    );
  }
}
