import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovingCirclePage(),
    );
  }
}

class MovingCirclePage extends StatefulWidget {
  const MovingCirclePage({super.key});

  @override
  State<MovingCirclePage> createState() => _MovingCirclePageState();
}

class _MovingCirclePageState extends State<MovingCirclePage> {
  bool _top = true;

  void _togglePosition() {
    setState(() {
      _top = !_top;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double circleSize = 80;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: _togglePosition, 
        child: Stack(
          children: [ 
            Container(color: Colors.white),
 
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: (MediaQuery.of(context).size.width - circleSize) / 2,
              top: _top ? 50 : screenHeight - circleSize - 50,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
