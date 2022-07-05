void main() {
  // String name = "Laranja";
  // double weight = 100.2;
  // String color = "Verde e Amarela";
  // String flavor = "Doce e cítrica";
  // int daysSinceHarvest = 30;

  Fruit orange = Fruit(
    "Laranja",
    100.2,
    "Verde e Amarela",
    "Doce e cítrica",
    30,
  );

  Fruit grape = Fruit(
    "Uva",
    40,
    "Roxa",
    "Doce",
    5,
  );

  Fruit banana = Fruit.nominated(
    name: 'Banana',
    weight: 84.95,
    color: 'Amarela',
    daysSinceHarvest: 10,
    flavor: 'Doce',
  );

  // showMature(
  //   orange.name,
  //   orange.daysSinceHarvest,
  //   flavor: orange.flavor,
  //   color: orange.color,
  //   weight: orange.weight,
  // );

  // showMature(
  //   grape.name,
  //   grape.daysSinceHarvest,
  //   color: grape.color,
  //   weight: grape.weight,
  // );

  // print(howManyDaysToMature(20));

  banana.checkMature(30);
  grape.checkMature(40);

  print(orange.checkMature(10));
}

// bool isMature(int daysSinceHarvest) => daysSinceHarvest >= 30;

// NULL SAFETY => Garantia dentro de uma linguagem de programação orientada a objetos que nenhuma referência de objeto terá valores nulos.

showMature(
  String name, // Parâmetros Posicionais Obrigatórios
  int days, // Parâmetros Posicionais Obrigatórios
  {
  String? color, // Parâmetros Nomeados Opcionais
  String? flavor = 'Sem sabor', // Parâmetros Com padrão
  required double weight, // Modificador "required"
}) {
  if (days >= 30) {
    print("A $name está madura.");
  } else {
    print("A $name não está madura.");
  }

  if (color != null) {
    print("A $name é $color");
  }

  if (flavor != null) {
    print("A $name está $flavor");
  }

  print("A $name pesa $weight\n");
}

int howManyDaysToMature(int days) {
  int daysToMature = 30;
  int daysMissing = daysToMature - days;

  return daysMissing;
}

class Fruit {
  String name;
  double weight;
  String color;
  String flavor;
  int daysSinceHarvest;
  bool? isMature;

  Fruit(
    this.name,
    this.weight,
    this.color,
    this.flavor,
    this.daysSinceHarvest, {
    this.isMature,
  });

  // /// Uma classe pode ter mais de um tipo de construtor

  // Exemplos de diferentes construtores
  Fruit.nominated({
    required this.name,
    required this.color,
    required this.weight,
    required this.daysSinceHarvest,
    required this.flavor,
    this.isMature,
  });

  Fruit.lowerCase(
    this.name,
    this.color,
    this.daysSinceHarvest,
    this.flavor,
    this.isMature,
    this.weight,
  ) {
    name = name.toLowerCase();
    color = color.toLowerCase();
  }
  // ///

  checkMature(int daysToMature) {
    isMature = daysSinceHarvest >= daysToMature;

    print(
        "A sua $name foi colhida a $daysSinceHarvest dias, e precisa de $daysToMature para poder comer. Ela está madura? $isMature");
  }
}
