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
      home: ColorAnimationPage(),
    );
  }
}

class ColorAnimationPage extends StatefulWidget {
  const ColorAnimationPage({super.key});

  @override
  State<ColorAnimationPage> createState() => _ColorAnimationPageState();
}

class _ColorAnimationPageState extends State<ColorAnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.red,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
 
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.repeat(reverse: true);
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Анимированный контейнер
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              const SizedBox(height: 32),

              // Кнопки
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startAnimation,
                    child: const Text('Запуск анимации'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _stopAnimation,
                    child: const Text('Остановить анимацию'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
