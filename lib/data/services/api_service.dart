part of 'services.dart';

class ApiService {
  Future<ListRestaurantResponse> getListRestaurants() async {
    final response = await http.get(baseUrl + "list");
    if (response.statusCode == 200) {
      return ListRestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<DetailRestaurantResponse> getDetailRestaurant(
      String idRestaurant) async {
    final response = await http.get(baseUrl + "detail/" + idRestaurant);
    if (response.statusCode == 200) {
      print(response.body);
      return DetailRestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Future<SearchRestaurantResponse> searchRestaurant(String query) async {
    final response = await http.get(baseUrl + "search?q=" + query);
    if (response.statusCode == 200) {
      return SearchRestaurantResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
