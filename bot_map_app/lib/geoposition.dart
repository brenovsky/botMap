import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Position> _currentPos() async {
  LocationPermission permission;
  bool ativado = await Geolocator.isLocationServiceEnabled();

  if (!ativado) {
    return Future.error("Turn on GPS");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Permission denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error("Permission denied forever");
  }

  return await Geolocator.getCurrentPosition();
}

Future<Placemark?> getLocal() async {
  try {
    Position posicao = await _currentPos();
    double lat = posicao.latitude;
    double long = posicao.longitude;

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placemark = placemarks[0];

    return placemark;
  } catch (e) {
    debugPrint("error in getLocal ${e.toString()}");
    return null;
  }
}

String formatPlaceMark(Placemark placemarks) {
  return "${placemarks.street}, ${placemarks.name} - ${placemarks.subLocality}, ${placemarks.subAdministrativeArea}";
}
