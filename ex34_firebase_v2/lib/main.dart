// import 'package:ex34_firebase_v2/Firestore.dart';
// import 'package:ex34_firebase_v2/Auth.dart';
import 'package:flutter/material.dart';
import 'package:ex34_firebase_v2/Storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    // home: Firestore(),
    // home: Auth(),
    home: StorageArquivo(),
  ));
}
