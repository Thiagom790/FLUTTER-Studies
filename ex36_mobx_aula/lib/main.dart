import 'package:ex36_mobx_aula/controller.dart';
import 'package:ex36_mobx_aula/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //   Um unico provider
    // Provider(
    //   create: (_) => Controller(),
    //   child: MaterialApp(
    //     home: Home(),
    //   ),
    // ),
    MultiProvider(
      providers: [
        Provider<Controller>(create: (_) => Controller()),
      ],
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}
