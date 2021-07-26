import 'package:ex22_youtube_clone/CustomSearchDelegate.dart';
import 'package:ex22_youtube_clone/telas/Biblioteca.dart';
import 'package:ex22_youtube_clone/telas/EmAlta.dart';
import 'package:ex22_youtube_clone/telas/Inicio.dart';
import 'package:ex22_youtube_clone/telas/Inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 0.8,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _resultado = res;
              });
              print('Resultado ' + res);
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.videocam),
          //   onPressed: () {
          //     print("Video");
          //   },
          // ),
          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {
          //     print("conta");
          //   },
          // ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            label: 'Inicio',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Em Alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: 'Inscrições',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
    ;
  }
}
