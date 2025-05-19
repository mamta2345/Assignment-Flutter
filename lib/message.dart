import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handler(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
  // Handle the background message here
}

class Firesbaseapi {
  final _firebasemessage = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebasemessage.requestPermission();
    String? token = await _firebasemessage.getToken();
    print("Firebase Token: $token");
    FirebaseMessaging.onBackgroundMessage(handler);
  }
}
