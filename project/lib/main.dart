import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тестовое приложение', 
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 400,
                    child: Image.asset('assets/images/image.jpeg'),
                ),
                SizedBox(height: 20),
                Text(
                    'Это, кстати, правда )',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "PenguinAttack",
                        fontWeight: FontWeight.bold,
                    ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
