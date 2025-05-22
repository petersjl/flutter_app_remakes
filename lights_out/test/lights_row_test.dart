import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:lights_out/lights_row.dart';
import 'package:lights_out/lights_out_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockLightsOutViewModel extends Mock implements LightsOutViewModel {}

void main() {
  setUpAll(() {
    registerFallbackValue(<bool>[]);
  });

  testWidgets('LightsRow displays correct icons and responds to taps', (
    WidgetTester tester,
  ) async {
    final mockViewModel = MockLightsOutViewModel();
    when(() => mockViewModel.lights).thenReturn([true, false, true]);
    when(() => mockViewModel.gameWon).thenReturn(false);
    when(() => mockViewModel.toggleLight(any())).thenAnswer((invocation) {});

    await tester.pumpWidget(
      ChangeNotifierProvider<LightsOutViewModel>.value(
        value: mockViewModel,
        child: const MaterialApp(home: Scaffold(body: LightsRow())),
      ),
    );

    // Check that the correct icons are displayed
    final icons = tester.widgetList<Icon>(find.byType(Icon)).toList();
    expect(icons.length, 3);
    expect((icons[0].icon), Icons.lightbulb);
    expect((icons[1].icon), Icons.lightbulb_outline);
    expect((icons[2].icon), Icons.lightbulb);

    // Tap the first light button
    await tester.tap(find.byType(IconButton).at(0));
    await tester.pump();
    verify(() => mockViewModel.toggleLight(0)).called(1);
  });

  testWidgets('LightsRow disables buttons when game is won', (
    WidgetTester tester,
  ) async {
    final mockViewModel = MockLightsOutViewModel();
    when(() => mockViewModel.lights).thenReturn([true, false, true]);
    when(() => mockViewModel.gameWon).thenReturn(true);

    await tester.pumpWidget(
      ChangeNotifierProvider<LightsOutViewModel>.value(
        value: mockViewModel,
        child: const MaterialApp(home: Scaffold(body: LightsRow())),
      ),
    );

    final iconButtons = tester.widgetList<IconButton>(find.byType(IconButton));
    for (final button in iconButtons) {
      expect(button.onPressed, isNull);
    }
  });
}
