import 'package:ex36_mobx_aula/controller.dart';
import 'package:ex36_mobx_aula/principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Controller controller;
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // autorun((_) {
    //   print(controller.email);
    // });
    controller = Provider.of<Controller>(context);

    reactionDisposer = reaction(
      (_) => controller.usuarioLogado,
      (usuarioLogado) {
        if (usuarioLogado == true) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => Principal()));
        }
      },
    );
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _incrementar() {
    //   controller.incrementar();
    // }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.all(16),
            //   child: Observer(
            //     builder: (_) {
            //       return Text('${controller.contador}');
            //     },
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setSenha,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(
                    '*Campos não validados: ${controller.emailSenha}',
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(builder: (_) {
                return ElevatedButton(
                  child: controller.carregando
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : Text(
                          'logar',
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                  onPressed: controller.formularioValidado
                      ? () {
                          controller.logar();
                        }
                      : null,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
