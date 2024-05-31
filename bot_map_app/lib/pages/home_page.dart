import 'package:bot_map/assets/button.dart';
import 'package:bot_map/assets/log_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogBox(),
          MainButton(),
        ],
      ),
    );
  }
}
