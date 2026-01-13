import 'package:flutter/material.dart';

class ForgotPasswordLink extends StatefulWidget {
    const ForgotPasswordLink({super.key});

    @override
    State<ForgotPasswordLink> createState() => _ForgotPasswordLinkState();
}

class _ForgotPasswordLinkState extends State<ForgotPasswordLink>
    with SingleTickerProviderStateMixin {

    late final AnimationController _controller;
    late final Animation<double> _animation;

    @override
    void initState() {
        super.initState();

        _controller = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 300),
        );

        _animation = Tween<double>(begin: 1, end: 1.2).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
            ),
        );
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }

    Future<void> _onTap() async {
        await _controller.forward();
        await _controller.reverse();
    }

    @override
    Widget build(BuildContext context) {
        return ScaleTransition(
            scale: _animation,
            child: InkWell(
                onTap: _onTap,
                child: Text(
                    'Забыли пароль?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                    ),
                ),
            ),
        );
    }
}
