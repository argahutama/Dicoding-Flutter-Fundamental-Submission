part of 'services.dart';

class ApiService {
  String _baseUrl = "https://restaurant-api.dicoding.dev/";
  String imageUrl = "https://restaurant-api.dicoding.dev/images/medium/";

  Future<ListRestaurantResponse> getListRestaurants() async {
    final response = await http.get(_baseUrl + "list");
    if (response.statusCode == 200) {
      return ListRestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<DetailRestaurantResponse> getDetailRestaurant(
      String idRestaurant) async {
    final response = await http.get(_baseUrl + "detail/" + idRestaurant);
    if (response.statusCode == 200) {
      print(response.body);
      return DetailRestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<SearchRestaurantResponse> searchRestaurant(String query) async {
    final response = await http.get(_baseUrl + "search?q=" + query);
    if (response.statusCode == 200) {
      return SearchRestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
