import 'package:flutter/material.dart';

class FitnessProvider extends ChangeNotifier {
  double _bmi = 0;
  double _maxHeartRate = 0;
  double _healthyWeight = 0;
  double _waterAmount = 0;

  double get bmi => _bmi;
  double get maxHeartRate => _maxHeartRate;
  double get healthyWeight => _healthyWeight;
  double get waterAmount => _waterAmount;

  void bmiCalc(int weight, int height) {
    double h = height / 100;
    _bmi = weight / (h * h);
    notifyListeners();
  }

  void heartRateCalc(int age) {
    _maxHeartRate = 220.0 - age;
    notifyListeners();
  }

  void healthyWeightCalc(String? sex, int height) {
    if (sex == "Male") {
      _healthyWeight = 50 + (0.91 * (height - 152.4));
    } else{
      _healthyWeight = 45.5 + (0.91 * (height - 152.4));
    }
    notifyListeners();
  }

  void waterCalc(int weight) {
    _waterAmount = weight / 30;
    notifyListeners();
  }
}
