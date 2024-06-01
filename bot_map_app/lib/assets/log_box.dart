import 'package:flutter/material.dart';

void printLogMes(message, sent) {
  if (sent == 201) {
    print(message);
  } else {
    print("mensagem não enviada");
  }
}

class LogBox extends StatefulWidget {
  const LogBox({super.key});

  @override
  State<LogBox> createState() => _LogBoxState();
}

class _LogBoxState extends State<LogBox> {
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
            Text('teste', style: TextStyle(fontSize: 16),),
          ],
        ),
      )
    );
  }
}