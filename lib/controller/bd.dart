// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../consulta_registros_color.dart';
// import '../model/registro.dart';

// Future<List<Registro>> consultaColor() async {
//   print('holaq');
//   List<Registro> listaREgistros = [];
//   final ref = FirebaseDatabase.instance.ref();
//   final snapshot = await ref.child('detector/registros').get();
//   Map registros = snapshot.value as Map;
//   registros.forEach(
//     (key, value) {
//       // print(value);
//       Map registro = value as Map;
//       Registro regis = Registro(
//         registro['fecha'],
//         registro['color'],
//         registro['hora'],
//         registro['rojo'],
//         registro['verde'],
//         registro['azul'],
//       );
//       if (registro['color'] == 'verde') {
//         // print(registro);
//         listaREgistros.add(regis);
//       }
//     },
//   );
//   print(listaREgistros);
//   // ignore: use_build_context_synchronously
//   return listaREgistros;
//   // print(registros);
// }
