import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  final Set<Marker> _markers = {};
  late Position _position;
  bool _mapTypeNormal = true;
  Set<Circle> _circles = Set<Circle>();
  bool _radiusSlider = false;
  double _radiusValue = 3000.0;

  Set<Marker> get markers => _markers;
  Position get position => _position;
  bool get mapTypeNormal => _mapTypeNormal;
  Set<Circle> get circles => _circles;
  bool get radiusSlider => _radiusSlider;
  double get radiusValue => _radiusValue;

  void locationMarker(Marker marker) {
    _markers.clear();
    _markers.add(marker);
    notifyListeners();
  }

  void getLocation(Position position) {
    _position = position;
    notifyListeners();
  }

  void mapType() {
    _mapTypeNormal = !_mapTypeNormal;
    notifyListeners();
  }

  void addCircle(Circle circle) {
    _circles.clear();
    _circles.add(circle);
    notifyListeners();
  }

  void setRadiusSlider() {
    _radiusSlider = !_radiusSlider;
    notifyListeners();
  }

  void setRadiusValue(double value) {
    _radiusValue = value;
    notifyListeners();
  }
}
