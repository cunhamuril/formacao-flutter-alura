void main() {
  Coffee espresso = Coffee(
    bitternessIntensity: 7,
    name: 'Espresso',
    isHot: true,
    isSweet: false,
  );

  espresso.insertCapsule();
  espresso.insertCup();
  espresso.pushButton();
  espresso.getDrink();

  print('\n');

  Drink iceTea = Drink(name: 'Chá verde', isHot: false, isSweet: true);

  iceTea.insertCapsule();
  iceTea.insertCup();
  iceTea.pushButton();
  iceTea.getDrink();
}

abstract class Machine {
  void insertCapsule();

  void insertCup();

  void pushButton();

  void getDrink();
}

class Drink implements Machine {
  final String name;
  final bool isHot;
  final bool isSweet;

  Drink({
    required this.name,
    required this.isHot,
    required this.isSweet,
  });

  @override
  void insertCapsule() {
    print('Capsula de $name inserida');
  }

  @override
  void insertCup() {
    print('Copo inserido');
  }

  @override
  void pushButton() {
    print('Fazendo o(a) $name...');
  }

  @override
  void getDrink() {
    print('$name pronto(a)!');

    if (isHot) {
      print('$name está quente.');
    } else {
      print('$name está gelado.');
    }

    if (isSweet) {
      print('$name está adoçado.');
    }
  }
}

class Coffee extends Drink {
  final int bitternessIntensity;

  Coffee({
    required this.bitternessIntensity,
    required super.name,
    required super.isHot,
    required super.isSweet,
  });
}
