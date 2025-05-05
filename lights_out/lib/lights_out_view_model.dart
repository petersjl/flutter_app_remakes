import 'package:flutter/material.dart';
import 'package:lights_out/lights_out_model.dart';

class LightsOutViewModel extends ChangeNotifier {
  final int _lightsCount;
  LightsOutModel _model;

  LightsOutViewModel([this._lightsCount = 7])
    : _model = LightsOutModel(_lightsCount);

  List<bool> get lights => _model.grid;
  int get clicks => _model.clicks;
  bool get gameWon => _model.gameWon;

  // Toggle a light and notify listeners
  void toggleLight(int index) {
    _model.toggleLight(index);
    notifyListeners();
  }

  void newGame() {
    _model = LightsOutModel(_lightsCount);
    notifyListeners();
  }
}
