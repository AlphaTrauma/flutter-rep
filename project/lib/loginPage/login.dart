import 'package:flutter/material.dart';
import './validators.dart';
import './forgot_password.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _formKey = GlobalKey<FormState>();

    bool _obscurePassword = true;

    void _submit() {
        if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Вход выполнен успешно'),
                ),
            );
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                Text(
                                    'Вход в систему',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                ),

                                const SizedBox(height: 24),

                                TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                           borderRadius: BorderRadius.all(
                                             Radius.circular(12),
                                           ),
                                        ),
                                        prefixIcon: Icon(Icons.email),
                                    ),
                                    validator: Validators.email,
                                ),

                                const SizedBox(height: 16),

                                TextFormField(
                                    obscureText: _obscurePassword,
                                    decoration: InputDecoration(
                                        labelText: 'Пароль',
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                             Radius.circular(12),
                                           ),
                                        ),
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                            icon: Icon(
                                                _obscurePassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    _obscurePassword = !_obscurePassword;
                                                });
                                            },
                                        ),
                                    ),
                                    validator: Validators.password,
                                ),

                                const SizedBox(height: 8),

                                const Align(
                                    alignment: Alignment.centerRight,
                                    child: ForgotPasswordLink(),
                                ),

                                const SizedBox(height: 24),

                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: _submit,
                                        child: const Text('Войти'),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
