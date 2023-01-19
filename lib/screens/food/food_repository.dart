class FoodRepository {
  Map<String, List<String>> all = {
    'Ração': [
      'Golden',
      'Pedigree',
      'Royal Canin',
    ],
    'Frutas': [
      'Banana',
      'Maçã',
      'Melancia',
    ],
    'Carnes': [
      'Alcatra',
      'Frango',
      'Porco',
    ]
  };

  List<String> types = ['Ração', 'Frutas', 'Carnes'];
  List<String> foods = [];
  List<String> showTypes() {
    /*Função de get para retornar os tipos de comidas cadastradas*/
    return types;
  }

  List<String> showFoods(type) {
    for (int i = 0; i < all.length; i++) {
      if (type == all.keys.toList()[i]) {
        foods = all[type]!;
      }
    }
    return foods;
  }
}
