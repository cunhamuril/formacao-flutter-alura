void main() {
  /**
   * Numbers
   */
  // int age = 27;
  int age = 0x0001B; // também aceita hexadecimal
  double tall = 1.79;

  // Suporta formato exponencial
  double exponential = 780e6; // 780 * 10 ^ 6

  print(age); // 27
  print(tall); // 1.79
  print(exponential); // 780000000

  /**
   * Booleans
   */
  bool isGeek = true;
  bool isAgeEqualtall = age == tall;

  print(isGeek); // true
  print(isAgeEqualtall); // false

  /**
   * Strings
   */
  String name = 'Murilo';
  String nickname = 'Turnymann';

  print(name);
  print(nickname);

  String phrase = 'I am $nickname\n'
      'but my name is $name. \n'
      'Am I geek? $isGeek. \n'
      'I have $tall feet tall. \n'
      'And I have $age years old.';

  print(phrase);
}
