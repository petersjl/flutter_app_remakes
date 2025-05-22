import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:lights_out/lights_out_view_model.dart';
import 'package:lights_out/lights_out_model.dart';

class MockLightsOutModel extends Mock implements LightsOutModel {}

void main() {
  late MockLightsOutModel mockModel;
  late LightsOutViewModel viewModel;

  setUp(() {
    mockModel = MockLightsOutModel();
    // Default mock values
    when(() => mockModel.grid).thenReturn([true, false, true]);
    when(() => mockModel.clicks).thenReturn(0);
    when(() => mockModel.gameWon).thenReturn(false);
    viewModel = LightsOutViewModel(model: mockModel);
  });

  test('lights getter returns model grid', () {
    expect(viewModel.lights, [true, false, true]);
    verify(() => mockModel.grid).called(1);
  });

  test('clicks getter returns model clicks', () {
    expect(viewModel.clicks, 0);
    verify(() => mockModel.clicks).called(1);
  });

  test('gameWon getter returns model gameWon', () {
    expect(viewModel.gameWon, false);
    verify(() => mockModel.gameWon).called(1);
  });

  test('toggleLight calls model.toggleLight and notifies listeners', () {
    when(() => mockModel.toggleLight(any())).thenReturn(null);
    var notified = false;
    viewModel.addListener(() {
      notified = true;
    });
    viewModel.toggleLight(1);
    verify(() => mockModel.toggleLight(1)).called(1);
    expect(notified, isTrue);
  });

  test('newGame calls model.startNewGame and notifies listeners', () {
    clearInteractions(mockModel);
    when(() => mockModel.startNewGame()).thenReturn(null);
    var notified = false;
    viewModel.addListener(() {
      notified = true;
    });
    viewModel.newGame();
    verify(() => mockModel.startNewGame()).called(1);
    expect(notified, isTrue);
  });
}
