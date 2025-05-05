import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lights_out/lights_out_model.dart';

class LightsOutViewModel extends ChangeNotifier {
  int _lightsCount;
  LightsOutModel _model;

  LightsOutViewModel([this._lightsCount = 7])
    : _model = LightsOutModel(_lightsCount) {
    _randomizeLights();
  }

  List<bool> get lights => _model.grid;
  int get clicks => _model.clicks;
  bool get gameWon => _model.grid.every((light) => !light);

  // Toggle a light and notify listeners
  void toggleLight(int index) {
    _model.toggleLight(index);
    notifyListeners();
  }

  void newGame() {
    _model = LightsOutModel(this._lightsCount);
    _randomizeLights();
    notifyListeners();
  }

  void _randomizeLights() {
    for (int i = 0; i < _model.lights; i++) {
      _model.toggleLight(Random().nextInt(_model.lights));
    }
    _model.clicks = 0; // Reset clicks after randomization
  }
}
