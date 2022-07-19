import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  final Set<Marker> _markers = {};
  late Position _position;
  


  Set<Marker> get markers => _markers;
  Position get position => _position;

  void locationMarker(Marker marker) {
    _markers.clear();
    _markers.add(marker);
    notifyListeners();
  }

  void getLocation(Position position){
    _position = position;
    notifyListeners();
  }


}
