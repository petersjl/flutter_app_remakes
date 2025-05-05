import 'package:flutter_test/flutter_test.dart';
import 'package:lights_out/lights_out_model.dart';

void main() {
  group('LightsOutModel', () {
    test('Initial state of the grid is all lights off', () {
      final model = LightsOutModel(5);
      expect(model.grid.every((light) => !light), isTrue);
    });

    test('Toggling a light changes its state and adjacent lights', () {
      final model = LightsOutModel(5);
      model.toggleLight(2);
      expect(model.getLightState(2), isTrue);
      expect(model.getLightState(1), isTrue);
      expect(model.getLightState(3), isTrue);
    });

    test('Game is won when all lights are off', () {
      final model = LightsOutModel(5);
      expect(model.gameWon, isTrue);
    });

    test('startNewGame randomizes the grid and resets clicks', () {
      final model = LightsOutModel(5);
      model.toggleLight(1);
      model.toggleLight(2);
      model.startNewGame();
      expect(model.clicks, 0);
      expect(model.grid.every((light) => !light), isFalse);
    });

    test('Clicks are counted correctly', () {
      final model = LightsOutModel(5);
      model.toggleLight(2);
      model.toggleLight(3);
      expect(model.clicks, 2);
    });
  });
}
