import 'package:flutter/material.dart';
import 'dart:math';

main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List _frases = [
    "Algumas pessoas surgem em nossas vidas como uma benção, outras como lição.",
    "Há momentos em que você precisa escolher entre virar a página ou fechar o livro.",
    "Seja humilde, pois, até o Sol com toda sua grandeza se põe e deixa a Lua brilhar.",
    "Quando as coisas não fizerem mais sentido e nada mais prender você, não tem"
    "ha medo de trocar o roteiro. Você só descobre novos caminhos quando muda a direção.",
  ];

  static String _fraseGerada = "Clique abaixo para gerar uma frase";

  _gerarFrase() {
    // 0,1,2
    var numeroRandomico = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroRandomico];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          // width: double.infinity,
          /*
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.amber),
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: Colors.green,
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
