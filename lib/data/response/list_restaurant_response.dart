part of 'response.dart';

class ListRestaurantResponse extends Equatable {
  ListRestaurantResponse({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  factory ListRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      ListRestaurantResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => ListRestaurantResponse.fromJson(x))),
      );

  factory ListRestaurantResponse.fromJsonNo() => ListRestaurantResponse(
        error: true,
        message: "Tidak Ada Internet\nPeriksalah Koneksi Anda!",
        count: 0,
        restaurants: [],
      );

  @override
  List<Object> get props => [restaurants, message, error];
}
