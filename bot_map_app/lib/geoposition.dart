import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Position> _currentPos() async {
  LocationPermission permissao;
  bool ativado = await Geolocator.isLocationServiceEnabled();

  if (!ativado) {
    return Future.error("Habilite a localização");
  }

  permissao = await Geolocator.checkPermission();
  if (permissao == LocationPermission.denied) {
    permissao = await Geolocator.requestPermission();
    if (permissao == LocationPermission.denied) {
      return Future.error("Permissão negada");
    }
  }

  if (permissao == LocationPermission.deniedForever) {
    return Future.error("Permissão negada permanentemente");
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
    debugPrint("erro no getLocal ${e.toString()}");
    return null;
  }
}

String formatPlaceMark(Placemark placemarks) {
  return "${placemarks.street}, ${placemarks.name} - ${placemarks.subLocality}, ${placemarks.subAdministrativeArea}";
}
