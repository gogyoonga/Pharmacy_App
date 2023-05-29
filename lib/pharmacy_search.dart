import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacySearch extends StatefulWidget {
  const PharmacySearch({Key? key}) : super(key: key);

  @override
  _PharmacySearchState createState() => _PharmacySearchState();
}

class _PharmacySearchState extends State<PharmacySearch> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.333043, 127.944499);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pharmacy Map'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          
        mapType: MapType.normal, //지도 유형 설정
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 20.0,
          ),
        ),
        
      ),
    );
  }
}


