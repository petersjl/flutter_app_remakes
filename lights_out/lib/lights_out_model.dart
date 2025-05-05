import 'dart:math';

class LightsOutModel {
  final int lights;
  int clicks = 0;
  List<bool> grid;

  LightsOutModel(this.lights) : grid = List.generate(lights, (_) => false) {
    _randomizeLights();
    clicks = 0; // Reset clicks after randomization
  }

  bool get gameWon => grid.every((light) => !light);

  bool getLightState(int index) {
    return grid[index];
  }

  void toggleLight(int index) {
    clicks++;
    grid[index] = !grid[index];
    if (index > 0) grid[index - 1] = !grid[index - 1]; // Left
    if (index < lights - 1) grid[index + 1] = !grid[index + 1]; // Right
  }

  void _randomizeLights() {
    for (int i = 0; i < lights; i++) {
      toggleLight(Random().nextInt(lights));
    }
    clicks = 0; // Reset clicks after randomization
  }
}
