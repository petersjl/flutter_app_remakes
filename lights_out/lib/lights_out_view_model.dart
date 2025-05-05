import 'package:flutter/material.dart';
import 'package:lights_out/lights_out_model.dart';

class LightsOutViewModel extends ChangeNotifier {
  LightsOutModel _model;

  LightsOutViewModel([lightsCount = 7]) : _model = LightsOutModel(lightsCount) {
    _model.startNewGame();
  }

  List<bool> get lights => _model.grid;
  int get clicks => _model.clicks;
  bool get gameWon => _model.gameWon;

  // Toggle a light and notify listeners
  void toggleLight(int index) {
    _model.toggleLight(index);
    notifyListeners();
  }

  void newGame() {
    _model.startNewGame();
    notifyListeners();
  }
}
