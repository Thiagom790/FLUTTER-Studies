import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Text("Comidas"),
            // Checkbox(
            //   value: this.valor,
            //   onChanged: (bool value) {
            //     setState(() {
            //       this.valor = value;
            //     });
            //   },
            // ),

            CheckboxListTile(
              title: Text("Comida Brasileira"),
              subtitle: Text("A melhor comida do Mundo!"),
              activeColor: Colors.red,
              value: _comidaBrasileira,
              // selected: _estaSelecionado,
              // secondary: Icon(Icons.add_box),
              onChanged: (bool valor) {
                setState(() {
                  _comidaBrasileira = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida Mexicana"),
              subtitle: Text("A melhor comida do Mexico!"),
              activeColor: Colors.red,
              value: _comidaMexicana,
              // selected: _estaSelecionado,
              // secondary: Icon(Icons.add_box),
              onChanged: (bool valor) {
                setState(() {
                  _comidaMexicana = valor;
                });
              },
            ),
            RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                print("Comida Brasielira " +
                    _comidaBrasileira.toString() +
                    "\nComida Mexicana " +
                    _comidaMexicana.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
