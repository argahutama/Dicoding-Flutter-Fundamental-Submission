part of 'pages.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting', style: blackFontStyle),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<SettingProvider>(
        builder: (context, provider, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Material(
                child: ListTile(
                  title: Text(
                    'Scheduling Restaurant',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: ChangeNotifierProvider<ScheduleProvider>(
                    create: (_) => ScheduleProvider(),
                    child: Consumer<ScheduleProvider>(
                      builder: (context, scheduled, _) {
                        return Switch.adaptive(
                          activeColor: Colors.amber,
                          value: provider.isDailyTrendingActive,
                          onChanged: (value) async {
                            scheduled.scheduledRestaurants(value);
                            provider.enableDailyTrending(value);
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
