part of 'models.dart';

class RestaurantDetails extends Equatable {
  RestaurantDetails({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menu,
    this.rating,
    this.customerReviews,
  });

  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menu;
  final double rating;
  final List<CustomerReview> customerReviews;

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) =>
      RestaurantDetails(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menu: Menu.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );

  Restaurant toRestaurant() => Restaurant(
        id: this.id,
        name: this.name,
        description: this.description,
        city: this.city,
        address: this.address,
        pictureId: this.pictureId,
        rating: this.rating,
      );

  @override
  List<Object> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        categories,
        menu,
        rating,
        customerReviews
      ];
}
