part of 'response.dart';

class DetailRestaurantResponse extends Equatable {
  DetailRestaurantResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  final bool error;
  final String message;
  final RestaurantDetails restaurant;

  factory DetailRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantResponse(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetails.fromJson(json["restaurant"]),
      );
  factory DetailRestaurantResponse.fromJsonNo() => DetailRestaurantResponse(
        error: true,
        message: "No Internet Connection\nCheck Your Connectivity!",
        restaurant: null,
      );

  @override
  List<Object> get props => [error, message, restaurant];
}
