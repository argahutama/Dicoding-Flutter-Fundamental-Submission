import 'package:flutter_test/flutter_test.dart';
import 'package:retaurant_app/services/services.dart';

void main() {
  test('Fetch restaurant name', () async {
    final restoData = await ApiService().getListRestaurants();
    var restoName = restoData.restaurants[0];
    expect(restoName.name, "Kafe Kita");
  });
}
