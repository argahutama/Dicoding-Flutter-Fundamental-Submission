import 'package:flutter_test/flutter_test.dart';
import 'package:retaurant_app/data/models/models.dart';

var testRestaurant = {
  "id": "s1knt6za9kkfw1e867",
  "name": "Kafe Kita",
  "description":
      "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
  "pictureId": "25",
  "city": "Gorontalo",
  "rating": 4
};

void main() {
  test("Test Parsing", () async {
    var result = Restaurant.fromJson(testRestaurant);
    expect(result.id, "s1knt6za9kkfw1e867");
    expect(result.name, "Kafe Kita");
    expect(result.description,
        "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...");
    expect(result.pictureId, "25");
    expect(result.city, "Gorontalo");
    expect(result.rating, 4);
  });
}
