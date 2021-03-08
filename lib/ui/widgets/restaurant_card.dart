part of 'widgets.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantCard({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Get.to(() => RestaurantDetailsPage(), arguments: this.restaurant);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        child: Hero(
                          tag: this.restaurant.pictureId,
                          child: Image.network(
                            restaurant.pictureId,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 125,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        // width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                restaurant.name,
                                style: blackFontStyle.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                restaurant.city,
                                style: blackFontStyle,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                // width: double.infinity,
                                child: Text(
                                  restaurant.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackFontStyle.copyWith(fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    icStar,
                                    width: 22,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      restaurant.rating.toString(),
                                      style:
                                          blackFontStyle.copyWith(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
