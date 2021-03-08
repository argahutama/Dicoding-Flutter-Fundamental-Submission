part of 'provider.dart';

class SearchRestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantsProvider({
    @required this.apiService,
  });

  SearchRestaurantResponse _restaurantsResult;
  String _message = '';
  ResultState _state;

  String get message => _message;
  SearchRestaurantResponse get result => _restaurantsResult;
  ResultState get state => _state;

  Future<dynamic> searchRestaurant(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurants = await apiService.searchRestaurant(query);
      if (restaurants.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantsResult = restaurants;
      }
    } on SocketException {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Periksa Koneksi Internet Anda!';
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}
