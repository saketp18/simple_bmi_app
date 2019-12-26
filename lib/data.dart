class Data {
  int height = 180;
  int weight = 70;
  int age = 25;

  double calculateBMI() {
    return weight / (height * height) * 10000;
  }
}

enum Gender { MALE, FEMALE }
