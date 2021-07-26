import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Seu endereço aqui";

  _recuperarCep() async {
    String cep = _controllerCep.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response;

    response = await http.get(url);

    Map retorno = json.decode(response.body);
    var logradouro = retorno['logradouro'];
    var bairro = retorno['bairro'];
    var localidade = retorno['localidade'];

    setState(() {
      _resultado = "$logradouro, $bairro, $localidade";
    });

    // print("resposta: " + response.statusCode.toString());
    // print("resposta: " + response.body);
    // print(resposta['bairro']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de Serviços Web'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite seu cep: ex: 05428200",
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _controllerCep,
            ),
            RaisedButton(
              child: Text('Clique aqui'),
              onPressed: _recuperarCep,
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
    ;
  }
}
