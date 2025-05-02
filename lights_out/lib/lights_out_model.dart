class LightsOutModel {
  final int lights;
  int clicks = 0;
  List<bool> grid;

  LightsOutModel(this.lights) : grid = List.generate(lights, (_) => false);

  bool getLightState(int index) {
    return grid[index];
  }

  void toggleLight(int index) {
    clicks++;
    grid[index] = !grid[index];
    if (index > 0) grid[index - 1] = !grid[index - 1]; // Left
    if (index < lights - 1) grid[index + 1] = !grid[index + 1]; // Right
  }
}
