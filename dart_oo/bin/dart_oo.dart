import 'dart:ffi';

void main() {
  String name = "Laranja";
  double weight = 100.2;
  String color = "Verde e Amarela";
  String flavor = "Doce e cítrica";
  int daysSinceHarvest = 30;

  showMature(
    name,
    daysSinceHarvest,
    flavor: flavor,
    color: color,
    weight: weight,
  );

  showMature(
    "Uva",
    20,
    color: 'Roxa',
    weight: 40,
  );
}

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

// bool isMature(int daysSinceHarvest) => daysSinceHarvest >= 30;
