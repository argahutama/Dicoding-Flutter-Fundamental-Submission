part of 'response.dart';

class SearchRestaurantResponse extends Equatable {
  SearchRestaurantResponse({
    this.error,
    this.message,
    this.restaurants,
  });

  final bool error;
  final String message;
  final List<Restaurant> restaurants;

  factory SearchRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResponse(
        error: json["error"],
        message: json["message"] ?? "Failed to Load",
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  factory SearchRestaurantResponse.fromJsonNo() => SearchRestaurantResponse(
        error: true,
        message: "No Internet Connection\nCheck Your Connectivity!",
        restaurants: [],
      );

  @override
  List<Object> get props => [restaurants, message, error];
}
