class Menu {
  Menu({
    this.foods,
    this.drinks,
  });

  List<Food> foods;
  List<Drink> drinks;

  Menu.fromJson(Map<String, dynamic> json) {
    foods = <Food>[];
    json['foods'].forEach((v) {
      foods.add(Food.fromJson(v));
    });

    drinks = <Drink>[];
    json['drinks'].forEach((v) {
      drinks.add(Drink.fromJson(v));
    });
  }
}

class Drink {
  String name;
  Drink({this.name});

  Drink.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Food {
  String name;

  Food({this.name});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
