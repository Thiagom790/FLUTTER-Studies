import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  _carregarItens() {
    _itens = [];
    for (var i = 0; i < 11; i++) {
      Map<String, dynamic> item = Map();
      item['titulo'] = "Titulo $i Loren ipson dolor sit amet";
      item['descricao'] = "Descrição $i Loren ipson dolor sit amet";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            Map item = _itens[indice];
            // print("Item ${_itens[indice].toString()}");
            // print("Item ${item.toString()}");

            return ListTile(
              title: Text(item['titulo']),
              subtitle: Text(item['descricao']),
            );
          },
        ),
      ),
    );
    ;
  }
}
