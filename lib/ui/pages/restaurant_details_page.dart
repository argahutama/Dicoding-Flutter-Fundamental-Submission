part of 'pages.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final String restaurantId = Get.arguments;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) => DetailRestaurantProvider(
        apiService: ApiService(),
        restaurantId: restaurantId,
      ),
      child: ChangeNotifierProvider<DbProvider>(
        create: (_) => DbProvider(databaseHelper: dbHelper),
        child: Consumer<DetailRestaurantProvider>(
          builder: (context, state, _) {
            return Scaffold(
              body: (state.state == ResultState.Loading)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (state.state == ResultState.HasData)
                      ? CustomScrollView(
                          slivers: <Widget>[
                            SliverAppBar(
                              leading: IconButton(
                                icon:
                                    Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              expandedHeight: 200,
                              pinned: true,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Hero(
                                  tag: state.result.restaurant.pictureId,
                                  child: Image.network(
                                    "${ApiService.imageUrl}" +
                                        "${state.result.restaurant.pictureId}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  state.result.restaurant.name,
                                  style: whiteFontStyle.copyWith(
                                      fontWeight: FontWeight.w700),
                                ),
                                centerTitle: true,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 16),
                                    Padding(
                                      padding: EdgeInsets.only(left: 3),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.place,
                                            size: 16,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 4),
                                          Padding(
                                            padding: EdgeInsets.only(top: 2),
                                            child: Text(
                                                state.result.restaurant.city),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          icStar,
                                          width: 22,
                                        ),
                                        SizedBox(width: 4),
                                        Text(state.result.restaurant.rating
                                            .toString()),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      state.result.restaurant.description,
                                      style: blackFontStyle,
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(height: 32),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Divider(
                                                height: 0,
                                                thickness: 0.5,
                                                color: Colors.green)),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(36),
                                            color: primaryColor,
                                          ),
                                          child: Text(
                                            'Makanan',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Divider(
                                              height: 0,
                                              thickness: 0.5,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverGrid.count(
                              crossAxisCount: 2,
                              children: state.result.restaurant.menu.foods
                                  .map(
                                    (food) => Container(
                                      width: 50,
                                      height: 100,
                                      margin: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(icFood),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            food.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 24),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Divider(
                                              height: 0,
                                              thickness: 0.5,
                                              color: Colors.green),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(36),
                                            color: primaryColor,
                                          ),
                                          child: Text(
                                            'Minuman',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Divider(
                                              height: 0,
                                              thickness: 0.5,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverGrid.count(
                              crossAxisCount: 2,
                              children: state.result.restaurant.menu.drinks
                                  .map(
                                    (drink) => Container(
                                      width: 50,
                                      height: 100,
                                      margin: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(icBeverage),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            drink.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        )
                      : (state.state == ResultState.NoData)
                          ? Center(
                              child: Text(state.message),
                            )
                          : (state.state == ResultState.Error)
                              ? Center(
                                  child: Text(state.message),
                                )
                              : Center(
                                  child: Text(''),
                                ),
              floatingActionButton: Consumer<DbProvider>(
                builder: (context, provider, child) {
                  return FutureBuilder<bool>(
                    future: provider.isFavorite(restaurantId),
                    builder: (context, snapshot) {
                      var isFav = snapshot.data ?? false;
                      return FloatingActionButton(
                        child: Icon(
                          Icons.favorite,
                          color: isFav ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          isFav
                              ? provider.removeFavorite(restaurantId)
                              : provider.addFavorite(
                                  state.result.restaurant.toRestaurant());
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
