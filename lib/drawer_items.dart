import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil/consulta_registros_color.dart';
import 'package:movil/controller/bd.dart';

import 'model/registro.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListTile(
        //   title: const Text('Mis Listas'),
        //   onTap: () => Get.offAllNamed('home'),
        // ),
        ListTile(
          title: const Text('Conocenos'),
          onTap: () => Get.offAndToNamed('info'),
        ),

        ListTile(
          title: const Text('Manipular Servo'),
          onTap: () => Get.offAndToNamed('servo'),
        ),
        ListTile(
          title: const Text('Registros'),
          onTap: () => Get.offAndToNamed('registros'),
        ),
        ListTile(
          title: const Text('Verdes'),
          onTap: () async {
            List<Registro> listaREgistros = [];
            final ref = FirebaseDatabase.instance.ref();
            final snapshot = await ref.child('detector/registros').get();
            Map registros = snapshot.value as Map;
            registros.forEach(
              (key, value) {
                // print(value);
                Map registro = value as Map;
                Registro regis = Registro(
                    registro['fecha'],
                    registro['color'],
                    registro['hora'],
                    registro['rojo'].toString(),
                    registro['verde'].toString(),
                    registro['azul'].toString());
                if (registro['color'] == 'verde') {
                  // print(registro);
                  listaREgistros.add(regis);
                }
              },
            );
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrosColor(
                          listRegistros: listaREgistros,
                          color: 'verdes',
                        )));
          },
        ),
        ListTile(
          title: const Text('Rojo'),
          onTap: () async {
            List<Registro> listaREgistros = [];
            final ref = FirebaseDatabase.instance.ref();
            final snapshot = await ref.child('detector/registros').get();
            Map registros = snapshot.value as Map;
            registros.forEach(
              (key, value) {
                // print(value);
                Map registro = value as Map;
                Registro regis = Registro(
                    registro['fecha'],
                    registro['color'],
                    registro['hora'],
                    registro['rojo'].toString(),
                    registro['verde'].toString(),
                    registro['azul'].toString());
                if (registro['color'] == 'rojo') {
                  // print(registro);
                  listaREgistros.add(regis);
                }
              },
            );
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrosColor(
                        listRegistros: listaREgistros, color: 'rojos')));
          },
        ),
        ListTile(
          title: const Text('Blancos'),
          onTap: () async {
            List<Registro> listaREgistros = [];
            final ref = FirebaseDatabase.instance.ref();
            final snapshot = await ref.child('detector/registros').get();
            Map registros = snapshot.value as Map;
            registros.forEach(
              (key, value) {
                // print(value);
                Map registro = value as Map;
                Registro regis = Registro(
                    registro['fecha'],
                    registro['color'],
                    registro['hora'],
                    registro['rojo'].toString(),
                    registro['verde'].toString(),
                    registro['azul'].toString());
                if (registro['color'] == 'blanco') {
                  // print(registro);
                  listaREgistros.add(regis);
                }
              },
            );
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrosColor(
                        listRegistros: listaREgistros, color: 'blancos')));
          },
        ),
        ListTile(
          title: const Text('Azules'),
          onTap: () async {
            List<Registro> listaREgistros = [];
            final ref = FirebaseDatabase.instance.ref();
            final snapshot = await ref.child('detector/registros').get();
            Map registros = snapshot.value as Map;
            registros.forEach(
              (key, value) {
                // print(value);
                Map registro = value as Map;
                Registro regis = Registro(
                    registro['fecha'],
                    registro['color'],
                    registro['hora'],
                    registro['rojo'].toString(),
                    registro['verde'].toString(),
                    registro['azul'].toString());
                if (registro['color'] == 'azul') {
                  // print(registro);
                  listaREgistros.add(regis);
                }
              },
            );
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrosColor(
                        listRegistros: listaREgistros, color: 'azules')));
          },
        ),
        ListTile(
          title: const Text('Naranjas'),
          onTap: () async {
            List<Registro> listaREgistros = [];
            final ref = FirebaseDatabase.instance.ref();
            final snapshot = await ref.child('detector/registros').get();
            Map registros = snapshot.value as Map;
            registros.forEach(
              (key, value) {
                // print(value);
                Map registro = value as Map;
                Registro regis = Registro(
                    registro['fecha'],
                    registro['color'],
                    registro['hora'],
                    registro['rojo'].toString(),
                    registro['verde'].toString(),
                    registro['azul'].toString());
                if (registro['color'] == 'naranja') {
                  // print(registro);
                  listaREgistros.add(regis);
                }
              },
            );
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrosColor(
                        listRegistros: listaREgistros, color: 'naranjas')));
          },
        ),
      ],
    );
  }
}
