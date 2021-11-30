part of 'pages.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DbProvider>(
      create: (_) => DbProvider(databaseHelper: DatabaseHelper()),
      child: GeneralPage(
        title: "Favorite Restaurants",
        subtitle: "Recommendation restaurants for you!",
        isFavoritePage: true,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Consumer<DbProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.state == ResultState.HasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      var restaurant = state.list[index];
                      return RestaurantCard(
                        restaurant: restaurant,
                        callback: () => state.getFavorite(),
                      );
                    });
              } else {
                return Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/not_found.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
