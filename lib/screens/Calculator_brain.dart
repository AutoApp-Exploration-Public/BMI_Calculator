import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  double _bmi;

  String getResult() {
    if (_bmi <= 25.6) {
      return "Over Weight";
    } else if (_bmi <= 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }

  String getInterpretation() {
    if (_bmi <= 25.6) {
      return "You have to do exercise daily";
    } else if (_bmi <= 18.5) {
      return "You have nicely maintained your body";
    } else {
      return "You should eat healthy and nutritious food";
    }
  }
}
