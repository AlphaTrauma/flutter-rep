import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/contact.dart';

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsScreen({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Контакты')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.email),
            onTap: () {
              context.go('/contact/${contact.id}');
            },
          );
        },
      ),
    );
  }
}
