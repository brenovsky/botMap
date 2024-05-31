import 'package:bot_map/assets/twilio_bot.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        sendSMS();
        
      },
      style: FilledButton.styleFrom(
        shape: const CircleBorder(), padding: const EdgeInsets.all(72)),
      child: const Text("SEND")
    );
  }
}
