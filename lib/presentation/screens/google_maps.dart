import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/data/geolocator/geolocation.dart';
import 'package:flutter_fitness_app/logic/location_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapsPage extends StatelessWidget {
  GoogleMapsPage({Key? key}) : super(key: key);

  late final GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(0, 0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: context.watch<LocationProvider>().markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await determinePosition();

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                  position.latitude,
                  position.longitude,
                ),
                zoom: 15,
              ),
            ),
          );
          Marker marker = Marker(
            markerId: const MarkerId('Current location'),
            position: LatLng(
              position.latitude,
              position.longitude,
            ),
            infoWindow: const InfoWindow(title: 'Current location'),
          );
          context.read<LocationProvider>().locationMarker(marker);
        },
        label: const Text("Your current location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }
}
