import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('icono_notificacion');

  // const DarwinInitializationSettings initializationSettingsIOS =
  //     DarwinInitializationSettings();

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid
          // iOS: initializationSettingsIOS,
          );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> mostrarNotificacion(String mensaje, int id) async {
  // final String mensaje;
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your_channel_id', 'your_channel_ame',
          importance: Importance.max, priority: Priority.high);

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
      id, 'Treecko Movil', mensaje, notificationDetails);
}

Future<void> buscarNotificaciones(String user) async {
  // final String mensaje;
  final ref = FirebaseDatabase.instance.ref();
  int index = 0;
  var noti = await ref.child('treecko/usuarios/$user/notificaciones').get();
  try {
    Map notificaciones = noti.value as Map;
    notificaciones.forEach((key, value) async {
      Map info = value as Map;
      if (info['estado'] != 'v') {
        index += 1;

        print(info['descripcion']);
        mostrarNotificacion(info['descripcion'], index);
        // var notification = await ref.child('treecko/usuarios/$user/notificaciones/$key/estado').get();
        DatabaseReference delPermiso = FirebaseDatabase.instance
            .ref('treecko/usuarios/$user/notificaciones/$key/estado');
        await delPermiso.set('v');
      }
      //   // var delpermiso = await ref.child('treecko/usuarios/$user/notificaciones/$key').get();
      //   // DatabaseReference delPermiso = FirebaseDatabase.instance
      //   //     .ref('treecko/usuarios/$user/notificaciones/$key');
      //   // delPermiso.push().set('Hola');
    });
  } catch (e) {
    print(e);
  }
}
