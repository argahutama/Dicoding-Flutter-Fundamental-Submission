part of 'pages.dart';

class RestaurantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListRestaurantProvider>(
      create: (_) => ListRestaurantProvider(apiService: ApiService()),
      child: GeneralPage(
        title: "Restaurants",
        subtitle: "Recommendation restaurants for you!",
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Consumer<ListRestaurantProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.state == ResultState.HasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.result.restaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = state.result.restaurants[index];
                      return RestaurantCard(restaurant: restaurant);
                    });
              } else if (state.state == ResultState.NoData) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state.state == ResultState.Error) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Center(
                  child: Text(''),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
