import 'package:flutter/material.dart';
import 'package:bot_map/geoposition.dart';

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
              getLocal();
            },
            child: const Icon(Icons.play_arrow_outlined),
          ),
        ],
      ),
    );
  }
}
