import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _escolhaUsuario = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Switch(
            //   value: _escolhaUsuario,
            //   onChanged: (bool valor) {
            //     setState(() {
            //       _escolhaUsuario = valor;
            //     });
            //   },
            // ),
            // Text("Receber Notificações"),
            SwitchListTile(
              activeColor: Colors.red,
              selected: _escolhaUsuario,
              title: Text("Receber Notificações"),
              value: _escolhaUsuario,
              onChanged: (bool valor) {
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
