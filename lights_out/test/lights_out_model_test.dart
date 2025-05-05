import 'package:flutter_test/flutter_test.dart';
import 'package:lights_out/lights_out_model.dart';

void main() {
  group('LightsOutModel', () {
    test('Initial state of the grid is all false', () {
      final model = LightsOutModel(5);
      expect(model.grid, [false, false, false, false, false]);
    });

    test('Toggling a light toggles that light and adjacent lights', () {
      final model = LightsOutModel(5);
      model.toggleLight(2);
      expect(model.grid, [false, true, true, true, false]);
    });

    test('Toggling the first light only toggles itself and the next light', () {
      final model = LightsOutModel(5);
      model.toggleLight(0);
      expect(model.grid, [true, true, false, false, false]);
    });

    test(
      'Toggling the last light only toggles itself and the previous light',
      () {
        final model = LightsOutModel(5);
        model.toggleLight(4);
        expect(model.grid, [false, false, false, true, true]);
      },
    );

    test('Click count increments on each toggle', () {
      final model = LightsOutModel(5);
      model.toggleLight(2);
      model.toggleLight(3);
      expect(model.clicks, 2);
    });
  });
}
