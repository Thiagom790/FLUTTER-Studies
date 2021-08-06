import 'package:flutter/material.dart';

/*
  Stateless -> Widgets que não podem ser alterados (Constantes),
  Statefull -> Wiggest que podem ser alterados (Variaveis)
*/
main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var _titulo = "Teste";
  @override
  Widget build(BuildContext context) {
    print("Build chamado");
    String _texto = "Thiago";
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  this._titulo = "Curso Flutter";
                });
                print("Pressionado");
              },
              child: Text("Clique Aqui"),
              color: Colors.red,
            ),
            Text("Nome: $_texto"),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _titulo = "Faceburguer";
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Text("Conteudo Principal"),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text("Botão")),
              Text("Texto 2"),
              Text("Texto 3"),
            ],
          ),
        ),
      ),
    );
  }
}
