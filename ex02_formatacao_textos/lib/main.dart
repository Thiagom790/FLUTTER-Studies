import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    title: "Frases do Dia",
    home: Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "orem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae"
            "justo placerat, hendrerit ante in, iaculis arcu. Ut eget neque dignis"
            "nissim nulla. Aliquam turpis turpis",
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
              wordSpacing: 0,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          )
        ],
      ),
    ),
  ));
}
