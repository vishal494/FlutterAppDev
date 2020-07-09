import 'dart:math';

double bmi;

class OperationBrains {
  OperationBrains({this.weight, this.height});

  final double height;
  final int weight;

  String result() {
    // print(weight);
    //print(height);
    bmi = weight / pow(height / 3.3, 2);
    // print(bmi);
    return bmi.toStringAsFixed(1);
  }

  String resultText() {
    //result();
    print("bmi $bmi");
    if (bmi >= 25.0) {
      return 'OverWeight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String interpretation() {
    // return 'You have a higher than normal body weight. Try to exercise more..';
    if (bmi >= 25.0)
      return 'You have a higher than normal body weight. Try to exercise more..';
    else if (bmi > 18.5)
      return 'You have a normal body weight. Good Job..!';
    else
      return 'You have a lower than normal body weight. You can eat a bit more..';
  }
}
