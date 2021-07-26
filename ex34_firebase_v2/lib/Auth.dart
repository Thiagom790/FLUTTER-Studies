import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  _autenticar() async {
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;

    // Criando usuário com email e senha
    String email = "thiagom790@gmail.com";
    String senha = '12345678';

    // auth
    //     .createUserWithEmailAndPassword(email: email, password: senha)
    //     .then((firebaseUser) {
    //   print("Usuário criado com sucesso! email: ${firebaseUser.user.email}");
    // }).catchError((error) {
    //   print("Error ao criar usuário: " + error.toString());
    // });

    // Deslogar usuário
    // auth.signOut();


    // autenticar com o usuário
    // auth
    //     .signInWithEmailAndPassword(email: email, password: senha)
    //     .then((firebaseUser) {})
    //     .catchError((error) {
    //   print("Error ao entrar: " + error.toString());
    // });

    User usarioAtual = auth.currentUser;
    if (usarioAtual != null) {
      print("Usuário logado: " + usarioAtual.email);
    } else {
      print("Usuário Deslogado");
    }
  }

  @override
  Widget build(BuildContext context) {
    _autenticar();
    return Container();
  }
}
