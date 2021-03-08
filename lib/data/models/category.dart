part of 'models.dart';

class Category extends Equatable {
  Category({
    this.name,
  });

  final String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  @override
  List<Object> get props => [name];
}
