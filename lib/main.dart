import 'package:flutter/material.dart';
import 'package:tela/mytheme/theme.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: whiteTheme,
      home: const Home(), // <- Agora a tela inicial é "Home"
    );
  }
}

