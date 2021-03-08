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
        message: json["message"] ?? "Data Gagal",
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  factory SearchRestaurantResponse.fromJsonNo() => SearchRestaurantResponse(
        error: true,
        message: "Tidak Ada Internet\nPeriksalah Koneksi Anda!",
        restaurants: [],
      );

  @override
  List<Object> get props => [restaurants, message, error];
}
