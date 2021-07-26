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
              onTap: () {
                // print("Print com ontap $indice");
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(item['titulo']),
                        content: Text(item['descricao']),
                        titlePadding: EdgeInsets.all(20),
                        titleTextStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                        backgroundColor: Colors.red,
                        actions: [
                          FlatButton(
                            onPressed: () {
                              print('Selecionado Sim');
                              Navigator.pop(context);
                            },
                            child: Text('Sim'),
                          ),
                          FlatButton(
                            onPressed: () {
                              print('Selecionado Não');
                              Navigator.pop(context);
                            },
                            child: Text('Nãõ'),
                          ),
                        ],
                      );
                    });
              },
              // onLongPress: () {
              //   print("Print com onlongPress");
              // },
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
