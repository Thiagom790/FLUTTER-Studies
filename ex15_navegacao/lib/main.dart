import 'package:ex15_navegacao/TelaSecundaria.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/secundaria': (context) => TelaSecundaria(),
    },
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    _exibirRotaComParametro() {
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => TelaSecundaria("Thiago Mario"),
          builder: (context) => TelaSecundaria(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para a segunda tela"),
              padding: EdgeInsets.all(15),
              // onPressed: _exibirRotaComParametro,
              onPressed: () {
                Navigator.pushNamed(context, '/secundaria');
              },
            )
          ],
        ),
      ),
    );
  }
}
