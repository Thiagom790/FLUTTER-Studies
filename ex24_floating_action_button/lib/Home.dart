import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatActionButton'),
      ),
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.amber,
        elevation: 6,
        icon: Icon(Icons.shopping_cart),
        label: Text('Adicionar'),
        onPressed: (){},
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(10)
        // ),
        // child: Icon(Icons.add),
        // mini: true,
        // onPressed: () {
        //   print("Resultado Botão pressionado");
        // },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        // shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
