import 'package:fab_circular_menu/fab_circular_menu.dart';
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
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: context.watch<LocationProvider>().markers,
            circles: context.watch<LocationProvider>().circles,
            zoomControlsEnabled: true,
            mapType: context.watch<LocationProvider>().mapTypeNormal
                ? MapType.normal
                : MapType.satellite,
            onMapCreated: (GoogleMapController controller) async {
              googleMapController = controller;
              Position position = await determinePosition();

              context.read<LocationProvider>().getLocation(position);

              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                      position.latitude,
                      position.longitude,
                    ),
                    zoom: 13,
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
          ),
          context.watch<LocationProvider>().radiusSlider
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "${context.watch<LocationProvider>().radiusValue.toStringAsFixed(0)} meters",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              child: IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.search),
                                onPressed: () async {
                                  var placeResult = await getPlaceDetails(
                                      LatLng(
                                        Provider.of<LocationProvider>(context,
                                                listen: false)
                                            .position
                                            .latitude,
                                        Provider.of<LocationProvider>(context,
                                                listen: false)
                                            .position
                                            .longitude,
                                      ),
                                      Provider.of<LocationProvider>(context,
                                              listen: false)
                                          .radiusValue);

                                  List<dynamic> searchedPlaces =
                                      placeResult['results'] as List;
                                  context
                                      .read<LocationProvider>()
                                      .setRadiusSlider();
                                  //turns out, I cant use nearby search without billing account, so this is where I stop
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                max: 7000.0,
                                min: 1000.0,
                                value: context
                                    .watch<LocationProvider>()
                                    .radiusValue,
                                onChanged: (newVal) {
                                  context
                                      .read<LocationProvider>()
                                      .setRadiusValue(newVal);
                                  context.read<LocationProvider>().addCircle(
                                        Circle(
                                          circleId: const CircleId('rand'),
                                          center: LatLng(
                                            Provider.of<LocationProvider>(
                                                    context,
                                                    listen: false)
                                                .position
                                                .latitude,
                                            Provider.of<LocationProvider>(
                                                    context,
                                                    listen: false)
                                                .position
                                                .longitude,
                                          ),
                                          fillColor:
                                              Colors.blue.withOpacity(0.1),
                                          radius: newVal,
                                          strokeColor: Colors.blue,
                                          strokeWidth: 1,
                                        ),
                                      );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      floatingActionButton: FabCircularMenu(
        alignment: Alignment.bottomLeft,
        fabColor: Colors.blue.shade50,
        fabOpenColor: Colors.red.shade100,
        ringDiameter: 250,
        ringWidth: 60,
        ringColor: Colors.blue.shade100,
        fabSize: 60,
        children: [
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.map),
            onPressed: () {
              context.read<LocationProvider>().mapType();
            },
          ),
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.search),
            onPressed: () {
              context.read<LocationProvider>().addCircle(
                    Circle(
                      circleId: const CircleId('rand'),
                      center: LatLng(
                        Provider.of<LocationProvider>(context, listen: false)
                            .position
                            .latitude,
                        Provider.of<LocationProvider>(context, listen: false)
                            .position
                            .longitude,
                      ),
                      fillColor: Colors.blue.withOpacity(0.1),
                      radius:
                          Provider.of<LocationProvider>(context, listen: false)
                              .radiusValue,
                      strokeColor: Colors.blue,
                      strokeWidth: 1,
                    ),
                  );
              context.read<LocationProvider>().setRadiusSlider();
            },
          ),
        ],
      ),
    );
  }
}
