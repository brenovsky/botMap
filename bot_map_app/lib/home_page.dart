import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> _posicaoAtual() async {
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

void getLocalization() async {
  try {
    Position posicao = await _posicaoAtual();
    double lat = posicao.latitude;
    double long = posicao.longitude;

    debugPrint("Latitude: $lat, Longitude: $long");
  } catch (e) {
    debugPrint("Erro: $e");
  }
  
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Oiiiiii"),
          ElevatedButton(
            onPressed: () {
              getLocalization();
            },
            child: const Icon(Icons.play_arrow_outlined),
          ),
        ],
      ),
    );
  }
}
