import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:movil/drawer_header.dart';
import 'package:movil/drawer_items.dart';
import 'package:movil/notification_services.dart';

class MoverServo extends StatefulWidget {
  const MoverServo({Key? key}) : super(key: key);

  @override
  State<MoverServo> createState() => _MoverServo();
}

class _MoverServo extends State<MoverServo> {
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
                fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white),
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
    List colores = ['rojo', 'verde', 'blanco', 'azul', 'naranja'];
    Query dbRef = FirebaseDatabase.instance.ref().child('detector/actual');
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('detector/actual');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mover Servo'),
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
            margin: EdgeInsets.all(20),
            child: Column(children: [
              const Padding(padding: EdgeInsets.all(15.0)),
              Text(
                'Color Actual',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              SizedBox(
                height: 100,
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    String registro = snapshot.value as String;
                    // registro['key'] = snapshot.key;

                    print(registro);
                    if (registro == 'verde') {
                      rojoB = 102;
                      verdeB = 192;
                      azulB = 14;
                    } else if (registro == 'azul') {
                      rojoB = 38;
                      verdeB = 59;
                      azulB = 140;
                    } else if (registro == 'blanco') {
                      rojoB = 200;
                      verdeB = 200;
                      azulB = 200;
                    } else if (registro == 'rojo') {
                      rojoB = 200;
                      verdeB = 59;
                      azulB = 40;
                    } else if (registro == 'naranja') {
                      rojoB = 218;
                      verdeB = 129;
                      azulB = 40;
                    }
                    Map registroColor = {
                      "color": registro,
                      "rojoB": rojoB,
                      "verdeB": verdeB,
                      "azulB": azulB,
                    };

                    return listItem(registros: registroColor);
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(15.0)),
              Text(
                'Mover Servo',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Escoge tu color'),
                  items: colores.map((carrera) {
                    // ignore: sort_child_properties_last
                    return DropdownMenuItem(
                      value: carrera,
                      child: Text(carrera),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                    DatabaseReference referencia =
                        FirebaseDatabase.instance.ref('/detector/actual/color');
                    referencia.set(value);
                  }),
            ])));
  }
}
