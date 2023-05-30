import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class PharmacySearch extends StatefulWidget {
  const PharmacySearch({Key? key}) : super(key: key);

  @override
  _PharmacySearchState createState() => _PharmacySearchState();
}

class _PharmacySearchState extends State<PharmacySearch> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.333043, 127.944499);

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng position) {
    final markerId = MarkerId(position.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
      infoWindow: InfoWindow(title: 'Pharmacy'),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _getCurrentLocation() async {
    var locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      // 위치 권한이 거부되었을 경우 처리
      return;
    }

    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _addMarker(LatLng(position.latitude, position.longitude));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pharmacy Map'),
          backgroundColor: Colors.green,
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 20.0,
          ),
          markers: _markers,
        ),
      ),
    );
  }
}
