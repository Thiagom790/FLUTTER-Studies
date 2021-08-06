import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    title: "Botões",
    home: Container(
      color: Colors.white,
      child: Row(
        children: [
          FlatButton(
            onPressed: () {
              print("Botão pressionado");
            },
            child: Text(
              "Clique aqui",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
