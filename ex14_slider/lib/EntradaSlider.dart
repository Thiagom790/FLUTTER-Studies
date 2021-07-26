import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valorUsuario = 5;
  String _label = "Valor escolhido";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            Slider(
              label: _label,
              divisions: 5,
              value: _valorUsuario,
              activeColor: Colors.red,
              inactiveColor: Colors.purple,
              min: 0,
              max: 10,
              onChanged: (double valor) {
                setState(() {
                  _valorUsuario = valor;
                  _label = "Valor selecionado: " + valor.toString();
                });
                // print("Valor selecionado: " + _valorUsuario.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
