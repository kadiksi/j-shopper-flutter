import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/profile/profile_bloc.dart';
import 'package:j_courier/repositories/profile/profile_abstarct_repository.dart';

void getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token");
  final _profileBloc = ProfileBloc(
    GetIt.I<ProfileAbstractRepository>(),
  );
  _profileBloc.add(RegisterToken(token: token));
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User denied permission');
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}
