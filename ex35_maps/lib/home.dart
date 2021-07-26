import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();

  _onMapCreated(GoogleMapController googleMapController) {
    // é utilizando o controller que consigo recuperar o objeto que permite eu alterar o mapa
    _controller.complete(googleMapController);
  }

  _movimentarCamera() async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(-22.508649586811015, -44.163704672006695),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas e Geolocalizaçãõ'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: _movimentarCamera,
      ),
      body: Container(
        child: GoogleMap(
          //   mapType: MapType.normal,
          //   mapType: MapType.none,
          //   mapType: MapType.satellite,
          //   mapType: MapType.terrain,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(-22.538649586811015, -44.163704672006695),
              zoom: 16),
          onMapCreated: _onMapCreated,
        ),
      ),
    );
  }
}
