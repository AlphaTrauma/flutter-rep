import 'package:flutter/material.dart';
import 'pages/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Навигатор 1.0', home: const HomeScreen());
  }
}
