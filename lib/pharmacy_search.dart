import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PharmacySearch extends StatefulWidget {
  const PharmacySearch({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PharmacySearchState createState() => _PharmacySearchState();
}

class _PharmacySearchState extends State<PharmacySearch> {
  late Location location;
  late GoogleMapController mapController;
  LatLng _center = const LatLng(0, 0);
  final Set<Marker> _markers = {};
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    location = Location();
    _checkLocationPermission();
  }

  void _checkLocationPermission() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _startLocationUpdates();
}


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng position) {
    final markerId = MarkerId(position.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
      infoWindow: const InfoWindow(title: 'Pharmacy'),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _startLocationUpdates() async {
    try {
      await location.requestPermission();
    } catch (e) {
      // 위치 권한 거부 또는 예외 발생 시 처리
      return;
    }

    _locationSubscription = location.onLocationChanged.listen((LocationData updatedLocation) {
      setState(() {
        _center = LatLng(updatedLocation.latitude!, updatedLocation.longitude!);
        _addMarker(_center);
      });
    });
  }

  @override
void dispose() {
  _locationSubscription?.cancel(); // 위치 정보 업데이트 구독 취소
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Map'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 20.0,
              ),
              markers: _markers,
            ),
          ),
          ElevatedButton(
            onPressed: () => _checkLocationPermission(),
            child: const Text('Locate Me'),
          ),
        ],
      ),
    );
  }
}
