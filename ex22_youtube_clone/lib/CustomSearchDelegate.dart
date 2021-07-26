import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // No buil actions são a lista de ações que posso executar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Define o botão de voltar
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Constrói os resultados que foram pesquisados
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Define sugestões de pesquisa
    // Aparece toda vez que eu digito algo
    return Container();
    /*
    List<String> lista = List();

    if (query.isNotEmpty) {
      lista = ['android', 'android navegação', 'ios', 'jogos']
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index]),
          );
        },
      );
    } else {
      return Center(
        child: Text('Nenhum resultado para a pesquisa'),
      );
    }
    */
  }
}
