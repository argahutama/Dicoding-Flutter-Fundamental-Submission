part of 'provider.dart';

class SettingProvider extends ChangeNotifier {
  SharedPrefHelper helper;

  SettingProvider(this.helper) {
    _getDailyTrending();
  }

  bool _isDailyTrendingActive = false;
  bool get isDailyTrendingActive => _isDailyTrendingActive;

  void _getDailyTrending() async {
    _isDailyTrendingActive = await helper.isDailyTrending;
    notifyListeners();
  }

  void enableDailyTrending(bool value) {
    helper.setDailyTrending(value);
    _getDailyTrending();
  }
}
