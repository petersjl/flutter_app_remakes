import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lights_out/main.dart';
import 'package:lights_out/lights_out_view_model.dart';
import 'package:provider/provider.dart';
import 'package:lights_out/lights_out_model.dart';

class FakeLightsOutModel extends Fake implements LightsOutModel {
  late LightsOutModel innerModel;
  final List<bool> fakeGrid;
  FakeLightsOutModel({required this.fakeGrid}) {
    innerModel = LightsOutModel(fakeGrid.length);
    innerModel.grid = fakeGrid;
  }
  @override
  List<bool> get grid => innerModel.grid;

  @override
  int get clicks => innerModel.clicks;
  @override
  bool get gameWon => innerModel.gameWon;
  @override
  bool getLightState(int index) {
    return innerModel.getLightState(index);
  }

  @override
  void toggleLight(int index) {
    innerModel.toggleLight(index);
  }

  @override
  void startNewGame() {
    // Simulate starting a new game by resetting the grid
    innerModel.grid = fakeGrid;
    innerModel.clicks = 0; // Reset clicks after starting a new game
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Tapping lights toggles their state and disables when game is won',
    (WidgetTester tester) async {
      final fakeModel = FakeLightsOutModel(
        fakeGrid: [false, false, true, true, true, false, false],
      );
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LightsOutViewModel(model: fakeModel),
            ),
          ],
          child: const LightsOutApp(),
        ),
      );
      await tester.pumpAndSettle();

      final iconButtons = find.byType(IconButton);
      expect(iconButtons, findsNWidgets(7));

      // Tap the middle light (index 3)
      await tester.tap(iconButtons.at(3));
      await tester.pumpAndSettle();
      expect(fakeModel.fakeGrid[2], isFalse);
      expect(fakeModel.fakeGrid[3], isFalse);
      expect(fakeModel.fakeGrid[4], isFalse);

      // After winning, the text should show 'You won'
      expect(find.textContaining('You won'), findsOneWidget);

      // All buttons should be disabled
      final updatedIconButtons = tester.widgetList<IconButton>(iconButtons);
      for (final button in updatedIconButtons) {
        expect(button.onPressed, isNull);
      }
    },
  );
}
