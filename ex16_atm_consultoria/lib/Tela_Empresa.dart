import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing "
                  "elit. Nam placerat tortor ac leo rutrum, eget posuere metus acc"
                  "umsan. Morbi luctus gravida auctor. Curabitur nec rutrum lacus."
                  " Ut quis augue sed turpis semper gravida. Curabitur tincidunt m"
                  "assa vel fringilla suscipit. Pellentesque interdum scelerisque l"
                  "acus, non blandit metus euismod at. Suspendisse vitae luctus leo,"
                  " eu condimentum justo.Nam feugiat et nisi ac tristique. Praesent"
                  " dictum viverra ipsum, eu feugiat sem pulvinar sed. Quisque quis "
                  "ullamcorper dui. Curabitur ac metus ligula. Sed malesuada ti"
                  "ncidunt sodales. Praesent sollicitudin ante in neque lacinia f"
                  "aucibus ut eget ante. Nullam tristique vel purus id venenatis. N"
                  "ulla facilisi. Sed at dolor ac purus consequat cursus. Morbi fel"
                  "is justo, consectetur sed sapien sed, ultricies commodo enim. Do"
                  "nec ac molestie leo, sed sollicitudin est. Etiam finibus egestas"
                  " orci id malesuada. Vestibulum ut mi non metus porttitor aliquam"
                  " ut luctus arcu. Nulla lacinia felis leo, nec pellentesque arcu sc"
                  "elerisque at. Etiam ultrices placerat aliquet. Proin nec neque turp"
                  "is."
                  "Lorem ipsum dolor sit amet, consectetur adipiscing "
                  "elit. Nam placerat tortor ac leo rutrum, eget posuere metus acc"
                  "umsan. Morbi luctus gravida auctor. Curabitur nec rutrum lacus."
                  " Ut quis augue sed turpis semper gravida. Curabitur tincidunt m"
                  "assa vel fringilla suscipit. Pellentesque interdum scelerisque l"
                  "acus, non blandit metus euismod at. Suspendisse vitae luctus leo,"
                  " eu condimentum justo.Nam feugiat et nisi ac tristique. Praesent"
                  " dictum viverra ipsum, eu feugiat sem pulvinar sed. Quisque quis "
                  "ullamcorper dui. Curabitur ac metus ligula. Sed malesuada ti"
                  "ncidunt sodales. Praesent sollicitudin ante in neque lacinia f"
                  "aucibus ut eget ante. Nullam tristique vel purus id venenatis. N"
                  "ulla facilisi. Sed at dolor ac purus consequat cursus. Morbi fel"
                  "is justo, consectetur sed sapien sed, ultricies commodo enim. Do"
                  "nec ac molestie leo, sed sollicitudin est. Etiam finibus egestas"
                  " orci id malesuada. Vestibulum ut mi non metus porttitor aliquam"
                  " ut luctus arcu. Nulla lacinia felis leo, nec pellentesque arcu sc"
                  "elerisque at. Etiam ultrices placerat aliquet. Proin nec neque turp"
                  "is."
                  "Lorem ipsum dolor sit amet, consectetur adipiscing "
                  "elit. Nam placerat tortor ac leo rutrum, eget posuere metus acc"
                  "umsan. Morbi luctus gravida auctor. Curabitur nec rutrum lacus."
                  " Ut quis augue sed turpis semper gravida. Curabitur tincidunt m"
                  "assa vel fringilla suscipit. Pellentesque interdum scelerisque l"
                  "acus, non blandit metus euismod at. Suspendisse vitae luctus leo,"
                  " eu condimentum justo.Nam feugiat et nisi ac tristique. Praesent"
                  " dictum viverra ipsum, eu feugiat sem pulvinar sed. Quisque quis "
                  "ullamcorper dui. Curabitur ac metus ligula. Sed malesuada ti"
                  "ncidunt sodales. Praesent sollicitudin ante in neque lacinia f"
                  "aucibus ut eget ante. Nullam tristique vel purus id venenatis. N"
                  "ulla facilisi. Sed at dolor ac purus consequat cursus. Morbi fel"
                  "is justo, consectetur sed sapien sed, ultricies commodo enim. Do"
                  "nec ac molestie leo, sed sollicitudin est. Etiam finibus egestas"
                  " orci id malesuada. Vestibulum ut mi non metus porttitor aliquam"
                  " ut luctus arcu. Nulla lacinia felis leo, nec pellentesque arcu sc"
                  "elerisque at. Etiam ultrices placerat aliquet. Proin nec neque turp"
                  "is.",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
