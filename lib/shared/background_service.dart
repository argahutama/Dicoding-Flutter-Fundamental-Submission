part of 'shared.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService _instance;
  static String _isolateName = 'isolate';
  static SendPort _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> randomRestaurantCallback() async {
    try {
      final NotificationHelper _notificationHelper = NotificationHelper();
      var result = await ApiService().getListRestaurants();
      if (result != null && result.restaurants.length > 0) {
        await _notificationHelper.showNotification(
          flutterLocalNotificationsPlugin,
          result,
        );
      }
    } catch (e) {}

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
