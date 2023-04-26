import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movil/info.dart';
import 'package:movil/notification_services.dart';
import 'consultarRegistros.dart';
import 'control_servo.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseDatabase database = FirebaseDatabase.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Treecko',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => const VerRegistros()),
          // GetPage(name: '/home', page: () => FetchData()),
          GetPage(name: '/info', page: () => const Contacto()),
          GetPage(name: '/servo', page: () => const MoverServo()),
          GetPage(name: '/registros', page: () => const VerRegistros()),
        ]);
  }
}
