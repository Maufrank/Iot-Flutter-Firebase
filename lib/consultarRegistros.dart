import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:movil/consulta_registros_color.dart';
import 'package:movil/drawer_header.dart';
import 'package:movil/drawer_items.dart';
import 'package:movil/notification_services.dart';

class VerRegistros extends StatefulWidget {
  const VerRegistros({Key? key}) : super(key: key);

  @override
  State<VerRegistros> createState() => _VerRegistros();
}

class _VerRegistros extends State<VerRegistros> {
  Widget listItem({required Map registros}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Color.fromARGB(
          255, registros['rojoB'], registros['verdeB'], registros['azulB']),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            registros['color'],
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            registros['fecha'],
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            registros['hora'],
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int rojoB = 14;
    int verdeB = 12;
    int azulB = 14;
    Query dbRef = FirebaseDatabase.instance.ref().child('detector/registros');
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('detector/registros');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Registros'),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerEncabezado(
                correo: '5C DSM',
                nombre: 'Clasificador de colores',
              ),
              DrawerItems(),
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map registro = snapshot.value as Map;
              registro['key'] = snapshot.key;
              if (registro["color"] == 'verde') {
                rojoB = 102;
                verdeB = 192;
                azulB = 14;
              } else if (registro["color"] == 'azul') {
                rojoB = 38;
                verdeB = 59;
                azulB = 140;
              } else if (registro["color"] == 'blanco') {
                rojoB = 200;
                verdeB = 200;
                azulB = 200;
              } else if (registro["color"] == 'rojo') {
                rojoB = 200;
                verdeB = 59;
                azulB = 40;
              } else if (registro["color"] == 'naranja') {
                rojoB = 218;
                verdeB = 129;
                azulB = 40;
              }
              Map registroColor = {
                "azul": registro["azul"],
                "color": registro["color"],
                "fecha": registro["fecha"],
                "hora": registro["hora"],
                "idRegistro": registro["idRegistro"],
                "rojo": registro["rojo"],
                "verde": registro["verde"],
                "rojoB": rojoB,
                "verdeB": verdeB,
                "azulB": azulB,
              };

              return listItem(registros: registroColor);
            },
          ),
        ));
  }
}
