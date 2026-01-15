import 'package:flutter/material.dart';
import '../models/contact.dart';
import './contact_item.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  final List<Contact> contacts = const [
    Contact(
      name: 'Иван Иванов',
      email: 'example@mail.ru',
      phone: '+7 900 111-11-11',
    ),
    Contact(
      name: 'Пётр Петров',
      email: 'example2@mail.ru',
      phone: '+7 900 222-22-22',
    ),
    Contact(
      name: 'Сидор Сидоров',
      email: 'example3@mail.ru',
      phone: '+7 900 333-33-33',
    ),
    Contact(
      name: 'Неизвестен',
      email: 'example4@mail.ru',
      phone: '+7 900 444-44-44',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Контакты')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(contact.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ContactItem(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
