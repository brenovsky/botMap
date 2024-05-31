import 'package:flutter/material.dart';

void printLog() {
  
}

class LogBox extends StatelessWidget {
  const LogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      color: Colors.red,
      child:
        const Text("Mensagem Enviada")
    );
  }
}
