import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              // text, number, emailAddress, datetime,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: "Digite uma url",
              ),
              // enabled: false,
              // maxLength: 3,
              // maxLengthEnforced: true,
              style: TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
              obscureText: true,
              /*
              onChanged: (String texto) {
                print("Valor digitado: " + texto);
              },*/
              // onSubmitted: (String texto) {
              //   print("Valor digitado: " + texto);
              // },
              controller: _textEditingController,
            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: () {
              print("Valor digitado: " + this._textEditingController.text);
            },
          ),
        ],
      ),
    );
  }
}
