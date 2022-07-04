void main() {
  int age = 27;
  bool isOfAge;

  /**
   * If Else
   */
  if (age >= 18) {
    isOfAge = true;
  } else {
    isOfAge = false;
  }

  print('Am I of age? $isOfAge');

  /**
   * For
   */
  for (int i = 1; i <= 5; i++) {
    print('Done $i loops');
  }

  /**
   * While
   */
  int energy = 100;

  while (energy > 0) {
    print('One more repetition');

    energy = energy - 10;
  }

  do {
    print('One more repetition');

    energy = energy - 10;
  } while (energy > 0);
}
