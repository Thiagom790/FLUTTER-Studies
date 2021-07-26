import 'package:ex30_tabbar/PrimeiraPagina.dart';
import 'package:ex30_tabbar/SegundaPagina.dart';
import 'package:ex30_tabbar/TerceiraPagina.dart';
import 'package:flutter/material.dart';

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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abas'),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Email",
              icon: Icon(Icons.email),
            ),
            Tab(
              text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          // Text('Primeira Pagina'),
          // Text('Segunda Pagina'),
          // Text('Terceira Pagina'),
          PrimeiraPagina(),
          SegundaPagina(),
          TerceiraPagina(),
        ],
      ),
    );
  }
}
