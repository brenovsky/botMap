import 'package:bot_map_app/pages/home_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'BotMap',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
  
}