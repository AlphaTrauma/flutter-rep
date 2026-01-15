import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  const ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Страница контакта")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Text('Email: ${contact.email}'),
            const SizedBox(height: 8),
            Text('Телефон: ${contact.phone}'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
