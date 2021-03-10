part of 'models.dart';

class Menu extends Equatable {
  Menu({
    this.foods,
    this.drinks,
  });

  final List<Category> foods;
  final List<Category> drinks;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        foods:
            List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(
            json["drinks"].map((x) => Category.fromJson(x))),
      );

  @override
  List<Object> get props => throw UnimplementedError();
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
