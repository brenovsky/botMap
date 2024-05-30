import 'package:bot_map/twilio_bot.dart';
import 'package:flutter/material.dart';

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
              sendSMS();
            },
            child: const Icon(Icons.play_arrow_outlined),
          ),
        ],
      ),
    );
  }
}
