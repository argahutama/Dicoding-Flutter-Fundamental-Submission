part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavoritePage;
  final Widget child;

  GeneralPage({
    this.title = "Title",
    this.subtitle = "subtitle",
    this.isFavoritePage = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            subtitle,
                            style: GoogleFonts.poppins(
                                color: "8D92A3".toColor(),
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.black),
                        onPressed: () => Get.to(
                          () =>
                              ChangeNotifierProvider<SearchRestaurantsProvider>(
                                  create: (_) => SearchRestaurantsProvider(
                                      apiService: ApiService()),
                                  child: RestaurantSearchPage()),
                        ),
                      ),
                      (!isFavoritePage)
                          ? IconButton(
                              icon: Icon(Icons.favorite, color: Colors.black),
                              onPressed: () => Get.to(
                                () => ChangeNotifierProvider<DbProvider>(
                                    create: (_) => DbProvider(
                                        databaseHelper: DatabaseHelper()),
                                    child: FavoritePage()),
                              ),
                            )
                          : SizedBox(),
                      (!isFavoritePage)
                          ? IconButton(
                              icon: Icon(Icons.settings, color: Colors.black),
                              onPressed: () => Get.to(
                                () => ChangeNotifierProvider<SettingProvider>(
                                  create: (_) => SettingProvider(
                                    SharedPrefHelper(
                                      sharedPreferences:
                                          SharedPreferences.getInstance(),
                                    ),
                                  ),
                                  child: SettingPage(),
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                Container(
                  height: 12,
                  width: double.infinity,
                  color: "FAFAFC".toColor(),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 12,
                ),
                Expanded(
                  child: child ?? SizedBox(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
