import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  _recupearBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);
      },
    );

    return bd;
    // print('Aberto: ' + retorno.isOpen.toString());
  }

  _salvar() async {
    Database db = await _recupearBancoDados();

    Map<String, dynamic> dadosUsuario = {"nome": 'Maria silva', "idade": 45};
    int id = await db.insert('usuarios', dadosUsuario);
    print("Salvo: $id");
  }

  _listarUsuarios() async {
    Database db = await _recupearBancoDados();

    // String sql = "SELECT * FROM usuarios";
    // String sql = "SELECT nome FROM usuarios";
    // String sql = "SELECT * FROM usuarios WHERE idade = 45";
    // String sql = "SELECT * FROM usuarios WHERE nome = 'Thiago' ";
    // String sql = "SELECT * FROM usuarios WHERE nome = 'Thiago' AND id = 2";
    // String sql = "SELECT * FROM usuarios WHERE nome = 'Thiago' OR id = 3";
    // String sql = "SELECT * FROM usuarios WHERE id BETWEEN 1 AND 2";
    // String sql = "SELECT * FROM usuarios WHERE id IN (1, 4)";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE 'T%' ";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE '%a%' ";
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE '%a%' ORDER BY nome"; //ASC DESK
    // String sql = "SELECT *, UPPER(nome) as Maiu FROM usuarios WHERE nome LIKE '%a%' ORDER BY nome"; //ASC DESK
    // String sql = "SELECT * FROM usuarios WHERE nome LIKE '%a%' ORDER BY UPPER(nome) ASC LIMIT 3";
    String sql = "SELECT * FROM usuarios";
    List usuarios = await db.rawQuery(sql);

    usuarios.forEach((usuario) {
      print("id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    });
    // print("usuarios: " + usuarios.toString());
  }

  _recuperarUsuarioPeloID(int id) async {
    Database db = await _recupearBancoDados();

    // CRUD -> Create, Read, Update, Delete
    List usuarios = await db.query("usuarios",
        columns: ['id', 'nome', 'idade'],
        // where: "id = ? AND nome = 'Thiago'",
        where: "id = ?",
        // whereArgs: [id, 'Thiago']);
        whereArgs: [id]);

    print("Usuario: " + usuarios.toString());
  }

  _excluirUsuarios(int id) async {
    Database db = await _recupearBancoDados();

    // Se colocar o delete sem where voce deleta todos os dados da tabela
    int retorno = await db.delete(
      "usuarios",
      where: 'id = ?',
      whereArgs: [id],
    );

    print("Item qtde removida: $retorno");
  }

  _atualizarUsuarios(int id) async {
    Database db = await _recupearBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Jõao alterado",
      "idade": 53,
    };

    db.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  @override
  Widget build(BuildContext context) {
    // _recupearBancoDados();
    // _salvar();
    // _recuperarUsuarioPeloID(5);
    // _excluirUsuarios(3);
    _atualizarUsuarios(6);
    _listarUsuarios();
    return Container();
  }
}
