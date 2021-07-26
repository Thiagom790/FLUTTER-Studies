import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    title: "Inserção de Imagens",
    home: Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
      ),
      child: Image.asset(
        "images/mesa.jpg",
        fit: BoxFit.scaleDown,
      ),
    ),
  ));
}
