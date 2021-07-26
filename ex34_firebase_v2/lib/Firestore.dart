import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Firestore extends StatefulWidget {
  @override
  _FirestoreState createState() => _FirestoreState();
}

class _FirestoreState extends State<Firestore> {
  _firestoreSalvar() async {
    await Firebase.initializeApp();

    FirebaseFirestore db = FirebaseFirestore.instance;

    // Essa estrutura serve para atualizar e salvar
    // Porém dessa forma o código é manual
    // db.collection("usuarios").doc("002").set({
    //   "nome": "Ana",
    //   "idade": 31,
    // });

    // Salvar sem colocar o código manual
    // DocumentReference ref = await db.collection("noticia").add({
    //   "titulo": "Criada nova moeda virtual",
    //   "descricao": "Texto de Exemplo"
    // });

    // print("Item salvo " + ref.id.toString());

    db.collection("noticia").doc("cbxs8AZZwyYBEq6tKHqa").set({
      "titulo": "Criada nova moeda virtual alterada",
      "descricao": "Texto de Exemplo"
    });
  }

  _excluirUsuario() async {
    await Firebase.initializeApp();

    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection("usuarios").doc("003").delete();
  }

  _recuperarUsuario() async {
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;

    // recupera apenas um usuário colocando o identificador dele
    // DocumentSnapshot snapshot =
    //     await db.collection("usuarios").doc("002").get();
    // var dados = snapshot.data();
    // print("dados: " + dados['nome']);

    // recupera os usuários porém não em tempo real
    // QuerySnapshot querySnapshot = await db.collection("usuarios").get();
    // querySnapshot.docs.forEach((DocumentSnapshot doc) {
    //   var dados = doc.data();
    //   print("Nome: ${dados['nome']} - Idade: ${dados['idade']}");
    // });

    // Dessa forma eu uso o banco em tempo real, adicionando um ouvinte
    //as alterações
    db.collection("usuarios").snapshots().listen((snapshot) {
      snapshot.docs.forEach((doc) {
        var dados = doc.data();
        print("Nome: ${dados['nome']} - Idade: ${dados['idade']}");
      });
    });
  }

  _aplicarFiltros() async {
    await Firebase.initializeApp();

    FirebaseFirestore db = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await db
        .collection("usuarios")
        // .where("nome", isEqualTo: "jamilton")
        // .where("idade", isEqualTo: 31)
        // dessa forma abaixo eu trago menor que 30 e maior que 15
        // .where("idade", isGreaterThan: 15)
        // .where("idade", isLessThan: 30)
        // descending é do menor para o maior
        /*Quando eu fizer uma ordenação dupla eu preciso criar um indice
        caso eu não crie da erro*/
        // .orderBy('idade', descending: true)
        // .orderBy("nome", descending: false)
        // .limit(2)
        // _______pesquisa por texto_______
        .where("nome", isGreaterThanOrEqualTo: 'an')
        .where('nome', isLessThanOrEqualTo: 'an' + '\uf8ff')
        .get();

    querySnapshot.docs.forEach((DocumentSnapshot docs) {
      var dados = docs.data();
      print("filto nome: ${dados['nome']} idade: ${dados['idade']}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // _firestoreSalvar();
    // _excluirUsuario();
    // _recuperarUsuario();
    _aplicarFiltros();
    return Container();
  }
}
