import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _escolhaUsuario = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Text("Masculino"),
            // Radio(
            //   value: "M",
            //   groupValue: _escolhaUsuario,
            //   onChanged: (String escolha) {
            //     setState(() {
            //       _escolhaUsuario = escolha;
            //     });
            //   },
            // ),
            // Text("Feminino"),
            // Radio(
            //   value: "F",
            //   groupValue: _escolhaUsuario,
            //   onChanged: (String escolha) {
            //     setState(() {
            //       _escolhaUsuario = escolha;
            //     });
            //   },
            // ),

            RadioListTile(
              title: Text("Masculino"),
              value: "m",
              groupValue: _escolhaUsuario,
              onChanged: (String escolha) {
                setState(() {
                  _escolhaUsuario = escolha;
                });
              },
            ),

            RadioListTile(
              title: Text("Feminino"),
              value: "f",
              groupValue: _escolhaUsuario,
              onChanged: (String escolha) {
                setState(() {
                  _escolhaUsuario = escolha;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
