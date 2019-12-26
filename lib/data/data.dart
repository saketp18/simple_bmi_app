class Data {
  int height = 180;
  int weight = 70;
  int age = 25;
  double bmi;

  double calculateBMI() {
    bmi = weight / (height * height) * 10000;
    return bmi;
  }

  String getResults() {
    if (bmi > 25) {
      return "Obese";
    } else {
      return "Normal";
    }
  }
}

enum Gender { MALE, FEMALE }
