import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Projeto Inicial",
    // home: Container(
    //   color: Colors.red,
    // ),
    // home: Column(
    //   children: <Widget>[
    //     Text("Texo 1"),
    //     Text("Texo 2"),
    //     Text("Texo 3"),
    //   ],
    // ),
    home: Row(
      children: <Widget>[
        Text("Texo 1"),
        Text("Texo 2"),
        Text("Texo 3"),
      ],
    ),
  ));
}
