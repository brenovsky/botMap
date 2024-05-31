import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void printLog() {}

class LogBox extends StatelessWidget {
  const LogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 400,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            
            children: const [
              Text("Mensagem enviada: Tv. Malafaia, 448 - Colubandê, São Goncaço", style: TextStyle(fontSize: 16),),
            ],
          ),
        ));
  }
}
