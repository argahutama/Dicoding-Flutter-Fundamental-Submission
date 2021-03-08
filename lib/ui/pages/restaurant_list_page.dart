part of 'pages.dart';

class RestaurantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Restaurants",
      subtitle: "Recommendation restaurants for you!",
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants =
                parseRestaurants(snapshot.data);
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(restaurant: restaurants[index]);
                },
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
