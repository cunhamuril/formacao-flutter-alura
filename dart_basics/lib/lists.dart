void main() {
  /**
   * Unique type lists
   */
  List<String> namesList = ['Murilo', 'John', 'Jane', 'Fulano', 'Ciclano'];

  print(namesList); // ['Murilo', 'John', 'Jane', 'Fulano', 'Ciclano']
  print(namesList[0]); // Murilo
  print(namesList.length); // 5

  /**
   * Dynamic lists
   */
  List<dynamic> me = [
    27,
    1.86,
    true,
    'Murilo Cunha',
    'Murilão'
  ]; // age, tall, isGeek, name, nickname

  print(me);

  String phrase = 'I am ${me[4]}\n'
      'but my name is ${me[3]}. \n'
      'Am I geek? ${me[2]}. \n'
      'I have ${me[1]} feet tall. \n'
      'And I have ${me[0]} years old.';

  print(phrase);

  /**
   * Most used list methods examples
   * https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2
   */
  List<String> fruits = ['banana', 'pineapple', 'watermelon'];

  // add()
  fruits.add('orange');
  print(fruits);

  // forEach()
  fruits.forEach((element) {
    print(element);
  });

  // map()
  var mappedFruits = fruits.map((fruit) => 'I love $fruit').toList();
  print(mappedFruits);

  // contains()
  print(fruits.contains('pineapple')); // true
  print(fruits.contains('strawberry')); // false

  // sort()
  List<int> numbers = [1, 3, 2, 5, 4];
  numbers.sort((num1, num2) => num1 - num2);

  print(numbers); // [1, 2, 3, 4, 5]

  /**
   * Var, Const & Final
   */
  int age = 27;
  print(age); // 27

  age = 42;
  print(age); // 42

  // CONST
  const String name = 'Murilo';

  // name = 'Muka'; // Error: Can't assign to the const variable 'name'
  print(name); // Murilo

  // FINAL
  final double tall; // diferente da const, final não precisa ser inicializada

  tall = 1.79;
  // tall = 1.80; // The final variable 'tall' can only be set once.

  print(tall); // 1.79

  // VAR
  var isGeek = true; // automaticamente define para boolean (não é boa prática)
  print(isGeek); // true

  isGeek = false;
  print(isGeek); // false
}
