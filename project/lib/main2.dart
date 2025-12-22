import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
    const MyApp();

    @override
    State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    String _message = 'Привет, Flutter!';

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                    title: const Text('Моё первое приложение'),
                ),
                body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                                _message,
                                style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                    setState(() {
                                        _message = 'Вы нажали кнопку!';
                                    });
                                },
                                child: const Text('Нажать'),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
