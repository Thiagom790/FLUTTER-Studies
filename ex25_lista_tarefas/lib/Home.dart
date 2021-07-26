import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerTarefa = TextEditingController();
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida;

  // ios/listatarefas/dados
  // android/data/listatarefas/dados

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarArquivo() async {
    var arquivo = await this._getFile();

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
    // print("Caminho: " + diretorio.path);
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    // Criar Dados
    Map<String, dynamic> tarefa = Map();
    tarefa['titulo'] = textoDigitado;
    tarefa['realizada'] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });
    this._salvarArquivo();
    _controllerTarefa.text = "";
  }

  _lerArquivo() async {
    try {
      final arquivo = await this._getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Widget criarItemLista(context, index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
      onDismissed: (direction) {
        // recuperar ultimo item excluído
        _ultimaTarefaRemovida = _listaTarefas[index];

        // Remove item da lista
        _listaTarefas.removeAt(index);
        _salvarArquivo();

        // snackbar
        final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
          content: Text('Tarefa removida'),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              // Insere novamente na lista
              setState(() {
                _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });
              _salvarArquivo();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: CheckboxListTile(
        title: Text(_listaTarefas[index]['titulo']),
        value: _listaTarefas[index]['realizada'],
        onChanged: (valorAlterado) {
          setState(() {
            _listaTarefas[index]['realizada'] = valorAlterado;
          });
          _salvarArquivo();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        this._listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // _salvarArquivo();

    print('Itens: ' + _listaTarefas.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Lista de Tarefas'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: this._listaTarefas.length,
              itemBuilder: criarItemLista,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Adicionar Tarefa'),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Digite sua tarefa",
                  ),
                  onChanged: (text) {},
                  controller: _controllerTarefa,
                ),
                actions: [
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'),
                  ),
                  FlatButton(
                    child: Text('Salvar'),
                    onPressed: () {
                      _salvarTarefa();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
