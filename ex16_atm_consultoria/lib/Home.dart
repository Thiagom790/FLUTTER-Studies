import 'package:ex16_atm_consultoria/Tela_Cliente.dart';
import 'package:ex16_atm_consultoria/Tela_Contato.dart';
import 'package:ex16_atm_consultoria/Tela_Empresa.dart';
import 'package:ex16_atm_consultoria/Tela_Servicos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _abrirEmpresa() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaEmpresa()),
    );
  }

  _abrirServicos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaServico()),
    );
  }

  _abrirClientes() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaCliente()),
    );
  }

  _abrirContatos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaContato()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png'),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: this._abrirEmpresa,
                    child: Image.asset("images/menu_empresa.png"),
                  ),
                  GestureDetector(
                    onTap: this._abrirServicos,
                    child: Image.asset("images/menu_servico.png"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: this._abrirClientes,
                    child: Image.asset("images/menu_cliente.png"),
                  ),
                  GestureDetector(
                    onTap: this._abrirContatos,
                    child: Image.asset("images/menu_contato.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
