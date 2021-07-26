import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as FirebaseStorage;
import 'dart:io';

class StorageArquivo extends StatefulWidget {
  @override
  _StorageArquivoState createState() => _StorageArquivoState();
}

class _StorageArquivoState extends State<StorageArquivo> {
  File _imagem;
  String _urlRecuperada;
  Future _recuperarImagem(bool daCamera) async {
    File imagemSelecionada;
    if (daCamera) {
      //Camera
      imagemSelecionada = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      // Galeria
      imagemSelecionada = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
    }

    setState(() {
      _imagem = imagemSelecionada;
    });
  }

  Future _uploadImage() async {
    await Firebase.initializeApp();

    // Referência do Arquivo
    FirebaseStorage.FirebaseStorage storage =
        FirebaseStorage.FirebaseStorage.instance;

    FirebaseStorage.Reference pastaRaiz = storage.ref();
    FirebaseStorage.Reference arquivo =
        pastaRaiz.child("fotos").child("foto1.jpg");

    // fazer o upload do arquivo
    FirebaseStorage.UploadTask task = arquivo.putFile(_imagem);

    // Controlar progresso do evento
    task.snapshotEvents.listen((FirebaseStorage.TaskSnapshot event) {
      print(
          'Progresso: ${(event.bytesTransferred / event.totalBytes) * 100} %');
    });

    // Recuperar Url da imagem
    task.then((FirebaseStorage.TaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(FirebaseStorage.TaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    print("Resultado url:" + url);
    setState(() {
      _urlRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Imagem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Camera'),
              onPressed: () {
                _recuperarImagem(true);
              },
            ),
            RaisedButton(
              child: Text('Galeria'),
              onPressed: () {
                _recuperarImagem(false);
              },
            ),
            _imagem == null ? Container() : Image.file(_imagem),
            _imagem != null
                ? RaisedButton(
                    child: Text('Upload Storage'),
                    onPressed: () {
                      _uploadImage();
                    },
                  )
                : Container(),
            _urlRecuperada == null
                ? Container()
                : Image.network(_urlRecuperada),
          ],
        ),
      ),
    );
  }
}
