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
          const Text("GPS Test"),
          FilledButton(
            onPressed: () {
              sendSMS();
            },
            child: const Text("Click here to send your current location!"),
          ),
        ],
      ),
    );
  }
}
