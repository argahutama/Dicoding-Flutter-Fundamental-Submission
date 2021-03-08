part of 'provider.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final Restaurant restaurant;

  DetailRestaurantProvider(
      {@required this.apiService, @required this.restaurant}) {
    fetchDetailRestaurant(restaurant);
  }

  DetailRestaurantResponse _detailRestaurant;
  String _message = '';
  ResultState _state;

  String get message => _message;
  DetailRestaurantResponse get result => _detailRestaurant;
  ResultState get state => _state;

  Future<dynamic> fetchDetailRestaurant(Restaurant restaurant) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurants = await apiService.getDetailRestaurant(restaurant.id);
      if (restaurants.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailRestaurant = restaurants;
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
