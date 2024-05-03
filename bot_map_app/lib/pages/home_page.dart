import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
        'Bot Map',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
        backgroundColor: Colors.deepPurple,
      ),

      floatingActionButton: TextButton(
        onPressed: () {},
        child: const Text('ON'),
      ),
    );
  }
}