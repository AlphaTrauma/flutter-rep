import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    const MyApp();

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: CounterPage(),
        );
    }
}

// Экран 
class CounterPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Текст на AppBar'),
            ),
            body: Center(
                child: CounterWidget(),
            ),
            floatingActionButton: null,
        );
    }
}

// Виджет с текстом
class TextWidget extends StatelessWidget {
    final String text;

    const TextWidget({required this.text});

    @override
    Widget build(BuildContext context) {
        return Text(
            text,
            style: TextStyle(fontSize: 20),
        );
    }
}

// Виджет со счётчиком
class CounterWidget extends StatefulWidget {
    @override
    _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
    int _counter = 0;

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: "Статичный текст"),
              SizedBox(height: 20),
              Text(
                  'Счётчик в Stateful: $_counter',
                  style: TextStyle(fontSize: 32),
              ),
              SizedBox(height: 20),
              FloatingActionButton(
                  onPressed: () {
                      setState(
                        () {
                          _counter++;
                          print("Кнопка нажата");
                        }
                        
                      );
                  },
                  child: Icon(Icons.add),
              ),
            ],
        );
    }
}
