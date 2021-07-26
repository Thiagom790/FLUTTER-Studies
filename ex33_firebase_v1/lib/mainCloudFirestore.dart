import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Salvar um dado no firebase com id manual
  //caso exista ele sobrescreve, caso não exista ele cria
  // db.collection("usuarios").doc('002').set({
  //   "nome": 'Ana Maria',
  //   "idade": 55,
  // });

  //Salvar um dado no firebase com id automatico
  // DocumentReference ref = await db.collection("noticias").add({
  //   "titulo": 'Ondas de calor em são paulo',
  //   "descricao": "texto de exemplo....",
  // });
  // print('Item salvo: ' + ref.id.toString());
  // db.collection("noticias").doc("kxcRoD1LwPUceDf2Rba5").set({
  //   "titulo": 'Ondas de calor em são paulo alterado',
  //   "descricao": "texto de exemplo....",
  // });

  // deletar usuario
  // db.collection("usuarios").doc('003').delete();

  //snapshot do ingles é foto, uma imagem instantanea
  //seleciona um usuário
  // DocumentSnapshot snapshot = await db.collection("usuarios").doc("001").get();
  // var dados = snapshot.data();
  // print("Dados: " + dados['idade'].toString());

  //seleciona todos os usuarios
  // QuerySnapshot querySnapshot = await db.collection("usuarios").get();
  // print("Dados usuário: " + querySnapshot.docs.toString());

  // querySnapshot.docs.forEach((DocumentSnapshot snapshot) {
  //   var dados = snapshot.data();
  //   print("dados do usuario:" + dados.toString());
  // });

  //recuperar em tempo real os dados do firebase
  //dessa forma ele adicona um ouvinte no firebase
  // db.collection("usuarios").snapshots().listen((snapshots) {
  //   var dados = snapshots.docs;
  //   dados.forEach((DocumentSnapshot item) {
  //     var dados = item.data();
  //     print("Usuarios: " + dados.toString());
  //   });
  // });

  // filtrar dados do firebase
  // QuerySnapshot querySnapshot = await db.collection("usuarios")
  // .where("idade", isEqualTo: 44)
  // .where("idade", isLessThan: 60)
  // .where("idade", isGreaterThan: 15)
  // .orderBy("idade", descending: true)
  // .orderBy("nome", descending: false)
  // .limit(2) posso usar o limit para limitar
  // .get();

  // filtrar parte de uma strig
  // var pesquisa = 'an';
  // QuerySnapshot querySnapshot = await db
  //     .collection("usuarios")
  //     .where("nome", isGreaterThanOrEqualTo: pesquisa)
  //     .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
  //     .get();

  // querySnapshot.docs.forEach((DocumentSnapshot document) {
  //   var dados = document.data();
  //   print("Filtro) nome: ${dados['nome']} idade: ${dados['idade']}");
  // });

  runApp(MaterialApp(
    home: Container(),
  ));
}
