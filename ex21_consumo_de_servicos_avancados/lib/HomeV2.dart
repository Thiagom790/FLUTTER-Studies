import 'package:ex21_consumo_de_servicos_avancados/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(this._urlBase + '/posts');
    var dadosJson = json.decode(response.body);
    List<Post> postagens = [];
    dadosJson.forEach((post) {
      Post p =
          new Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    });
    return postagens;
  }

  _post() async {
    // var corpo = json.encode({
    //   "userId": 120,
    //   "id": null,
    //   "title": "titulo",
    //   "body": "Corpo da Postagem",
    // });
    Post post = new Post(10, null, 'titulo', 'Corpo do Texto');
    var corpo = json.encode(post.toJson());

    http.Response response = await http.post(
      this._urlBase + '/posts',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: corpo,
    );

    print("Resposta: " + response.body);
    print("Status code: " + response.statusCode.toString());
  }

  _put() async {
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      // "title": "titulo alterado",
      "title": null,
      "body": "Corpo da Postagem alterada",
    });

    http.Response response = await http.put(
      this._urlBase + '/posts/2',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: corpo,
    );

    print("Resposta: " + response.body);
    print("Status code: " + response.statusCode.toString());
  }

  _patch() async {
    var corpo = json.encode({
      "userId": 120,
      "body": "Corpo da Postagem alterada",
    });

    http.Response response = await http.patch(
      this._urlBase + '/posts/2',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: corpo,
    );

    print("Resposta: " + response.body);
    print("Status code: " + response.statusCode.toString());
  }

  _delete() async {
    http.Response response = await http.delete(
      this._urlBase + '/posts/2',
    );

    print("Resposta: " + response.body);
    print("Status code: " + response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de Serviços Avançado'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: _post,
                  child: Text('Salvar'),
                ),
                RaisedButton(
                  // onPressed: _put,
                  onPressed: _patch,
                  child: Text('Atualizar'),
                ),
                RaisedButton(
                  onPressed: _delete,
                  child: Text('Deletar'),
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
              future: this._recuperarPostagens(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      print("Erro ao carregar a lista: " +
                          snapshot.error.toString());
                    } else {
                      print("Lista carregou");
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List<Post> lista = snapshot.data;
                          Post p = lista[index];

                          return ListTile(
                            title: Text(p.title),
                            subtitle: Text(p.id.toString()),
                          );
                        },
                      );
                    }
                }
                return Text('');
              },
            ))
          ],
        ),
      ),
    );
  }
}
