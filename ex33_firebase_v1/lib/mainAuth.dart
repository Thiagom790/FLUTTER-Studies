import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;

  // Criando usuário com email e senha
  String email = 'thiagom790@gmail.com';
  String senha = 'amateratsu01';

  /*
  Por padrão ao criar um usuário o firebase já loga ele
  auth
    .createUserWithEmailAndPassword(email: email, password: senha)
    .then((firebaseUser) {
      print("novo usuario: sucesso!! e-mail: " + firebaseUser.user.email);
    }).catchError((error) {
      print("Novo usuário: erro" + error.toString());
    });
  */

  // auth.signOut(); // utilize o signOut para deslogar o usuário

  // User user = await auth.currentUser;
  // if (user != null) {
  //   print("Usuário Logado " + user.email);
  // } else {
  //   print("Usuário deslogado");
  // }

  auth
    .signInWithEmailAndPassword(email: email, password: senha)
    .then((firebaseUser) {
      print("Usuario logado: email: " + firebaseUser.user.email);
    })
    .catchError((error) {
      print("Erro ao logar: " + error.toString());
    });

  runApp(MaterialApp(
    home: Container(),
  ));
}
