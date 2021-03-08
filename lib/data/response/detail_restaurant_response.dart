part of 'response.dart';

class DetailRestaurantResponse extends Equatable {
  DetailRestaurantResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  final bool error;
  final String message;
  final Restaurant restaurant;

  factory DetailRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantResponse(
        error: json["error"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
      );
  factory DetailRestaurantResponse.fromJsonNo() => DetailRestaurantResponse(
        error: true,
        message: "Tidak Ada Internet\nPeriksalah Koneksi Anda!",
        restaurant: null,
      );

  @override
  List<Object> get props => [error, message, restaurant];
}
