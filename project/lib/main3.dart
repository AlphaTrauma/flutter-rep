import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatefulWidget {
    const CounterApp();

    @override
    State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
    int value = 0;

    void inc() => setState(() => value++);

    @override
    Widget build(BuildContext context) {
        return CounterInherited(
            value: value,
            inc: inc,
            child: MaterialApp(
                home: Scaffold(
                    body: const Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                ShowValue(),
                                IncButton(),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}

class CounterInherited extends InheritedWidget {
    final int value;
    final VoidCallback inc;

    const CounterInherited({
        required this.value,
        required this.inc,
        required Widget child,
    }) : super(child: child);

    static CounterInherited of(BuildContext c) =>
        c.dependOnInheritedWidgetOfExactType<CounterInherited>()!;

    @override
    bool updateShouldNotify(covariant CounterInherited old) =>
        old.value != value;
}

class ShowValue extends StatelessWidget {
    const ShowValue();

    @override
    Widget build(BuildContext context) {
        return Text('${CounterInherited.of(context).value}');
    }
}

class IncButton extends StatelessWidget {
    const IncButton();

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            onPressed: CounterInherited.of(context).inc,
            child: const Text('+1'),
        );
    }
}
