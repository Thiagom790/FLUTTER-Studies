import 'package:ex28_minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'package:ex28_minhas_anotacoes/model/Anotacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloControler = TextEditingController();
  TextEditingController _descricaoControler = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = List<Anotacao>();

  _exibirTelaCadastro({Anotacao anotacao}) {
    String textoSalvarAtualizar = "";
    if (anotacao == null) {
      //salvando
      _tituloControler.text = "";
      _descricaoControler.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      // atualizar
      _tituloControler.text = anotacao.titulo;
      _descricaoControler.text = anotacao.descricao;
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$textoSalvarAtualizar Anotação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _tituloControler,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Título", hintText: "Digite titulo"),
              ),
              TextField(
                controller: _descricaoControler,
                decoration: InputDecoration(
                    labelText: "Descrição", hintText: "Digite a descrição"),
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            FlatButton(
              onPressed: () {
                //Salvar
                _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                Navigator.pop(context);
              },
              child: Text(textoSalvarAtualizar),
            ),
          ],
        );
      },
    );
  }

  _salvarAtualizarAnotacao({Anotacao anotacaoSelecionada}) async {
    String titulo = _tituloControler.text;
    String descricao = _descricaoControler.text;
    String data = DateTime.now().toString();

    if (anotacaoSelecionada == null) {
      //Salvar
      Anotacao anotacao = Anotacao(titulo, descricao, data);
      int id = await _db.savarAnotacao(anotacao);
    } else {
      //Atualizar
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = data;

      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    // print("Resultado: " + id.toString());

    _tituloControler.clear();
    _descricaoControler.clear();
    _recuperarAnotacoes();
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    var convert = (item) => Anotacao.fromMap(item);
    List<Anotacao> listaTemporaria =
        anotacoesRecuperadas.map<Anotacao>(convert).toList();

    setState(() {
      _anotacoes = listaTemporaria;
    });
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
    _recuperarAnotacoes();
  }

  _formatarData(String data) {
    initializeDateFormatting('pt_BR');

    // Y -> year Month -> M day -> d minute -> m
    // Hour -> H minte -> second -> s
    // var formatador = DateFormat("d-M-y");
    // var formatador = DateFormat("d/M/y H:m:s");
    // var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");

    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);

    return dataFormatada;
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Anotações'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _anotacoes.length,
              itemBuilder: (context, index) {
                final anotacao = _anotacoes[index];

                return Card(
                  child: ListTile(
                    title: Text(anotacao.titulo),
                    subtitle: Text(
                        '${_formatarData(anotacao.data)} - ${anotacao.descricao}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _exibirTelaCadastro(anotacao: anotacao);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _removerAnotacao(anotacao.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        onPressed: _exibirTelaCadastro,
      ),
    );
  }
}
