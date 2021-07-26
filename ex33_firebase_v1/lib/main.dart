import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _imagem;
  String _statusUpload = "Upload não iniciado";
  String _urlImagemRecuperada = null;

  Future _recuperarImagem(bool daCamera) async {
    var pickedFile;
    if (daCamera) {
      pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    } else {
      pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = File(pickedFile.path);
    });
  }

  Future _uploadImage() async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    //Referenciar arquivo
    firebase_storage.Reference pastaRaiz = storage.ref();
    firebase_storage.Reference arquivo =
        pastaRaiz.child("fotos").child("foto1.jpg");

    // Fazer upload da imagem
    // arquivo.putFile(_imagem);

    //como controlar o progresso do upload
    //fazer upload
    firebase_storage.UploadTask task = arquivo.putFile(_imagem);

    // controlar o progresso do upload
    task.snapshotEvents.listen((storageEvent) {
      if (storageEvent.state == firebase_storage.TaskState.running) {
        setState(() {
          _statusUpload = "Em progresso ....";
        });
      } else if (storageEvent.state == firebase_storage.TaskState.success) {
        setState(() {
          _statusUpload = "Upload Realizado com sucesso !";
        });
      }
    });

    //recuperar url da imagem
    task.then((snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  Future _recuperarUrlImagem(firebase_storage.TaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();
    // print("Url da imagem: " + url);
    setState(() {
      _urlImagemRecuperada = url;
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
            Text(_statusUpload),
            RaisedButton(
              onPressed: () {
                _recuperarImagem(true);
              },
              child: Text('Camera'),
            ),
            RaisedButton(
              onPressed: () {
                _recuperarImagem(false);
              },
              child: Text('Galeria'),
            ),
            _imagem != null
                ? Image.file(
                    _imagem,
                    width: 60,
                  )
                : Container(),
            _urlImagemRecuperada != null
                ? Image.network(_urlImagemRecuperada)
                : Container(),
            RaisedButton(
              onPressed: () {
                _uploadImage();
              },
              child: Text('Upload Storage'),
            ),
          ],
        ),
      ),
    );
  }
}
