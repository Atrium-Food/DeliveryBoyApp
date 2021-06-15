import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  LocationProvider({@required this.sharedPreferences});

  Placemark _address = Placemark();

  Placemark get address => _address;
  Position _currentLocation = Position(
    latitude: 0, longitude: 0,
    speed: 1, speedAccuracy: 1, altitude: 1, accuracy: 1, heading: 1, timestamp: DateTime.now(),
  );
  Position get currentLocation => _currentLocation;

  Future<Position> locateUser() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void getUserLocation() async {
    _currentLocation = await locateUser();
    print("Delivery Person LAT LONG:  (${_currentLocation.latitude},${_currentLocation.longitude})");
    try {
      var currentAddresses = await placemarkFromCoordinates(
          _currentLocation.latitude, _currentLocation.longitude);
      // // _currentLocation.latitude, _currentLocation.longitude
      // Coordinates coordinates= Coordinates(_currentLocation.latitude, _currentLocation.longitude);
      // var currentAddresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
     notifyListeners();
      _address = currentAddresses.first;
    } on Exception catch(e){
      print("$e Address can't be found");
      _address=null;
    }
    print("longitude"+_currentLocation.longitude.toString());
    notifyListeners();
  }
}
