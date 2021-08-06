import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Espaçamentos",
    home: Container(
      // padding: EdgeInsets.all(30),
      // padding: EdgeInsets.fromLTRB(2, 10, 20, 5),
      // margin: EdgeInsets.all(20),
      // margin: EdgeInsets.fromLTRB(10, 20, 5, 32),
      // margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
      ),
      // color: Colors.white,
      child: Column(
        children: [
          Text("Texto 1"),
          Padding(
            // padding: EdgeInsets.all(30),
            padding: EdgeInsets.only(top: 50),
            child: Text("Texto 2"),
          ),
          Text("Texto 3"),
          /*Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vulput"
            "ur maximus felis placerat,",
            textAlign: TextAlign.justify,
          ),*/
        ],
      ),
    ),
  ));
}
