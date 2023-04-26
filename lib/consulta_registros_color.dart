import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'controller/bd.dart';
import 'drawer_header.dart';
import 'drawer_items.dart';

import 'model/permiso_modelo.dart';
import 'model/registro.dart';

class RegistrosColor extends StatefulWidget {
  final List<Registro> listRegistros;
  final String color;

  const RegistrosColor(
      {Key? key, required this.listRegistros, required this.color})
      : super(key: key);

  @override
  State<RegistrosColor> createState() => _RegistrosColor();
}

class _RegistrosColor extends State<RegistrosColor> {
  @override
  Widget build(BuildContext context) {
    final List<Registro> listaRegistros = widget.listRegistros;
    final String color = widget.color;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registros ' + color),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerEncabezado(
              correo: 'MauMau',
              nombre: 'Mau',
            ),
            const DrawerItems(),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: listaRegistros.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaRegistros[index].color),
              subtitle: Text(
                'Fecha: ${listaRegistros[index].fecha}  Hora: ${listaRegistros[index].hora}',
              ),
              onTap: () {},
              minLeadingWidth: 100,
              minVerticalPadding: 15,
            );
          }),
    );
  }
}
