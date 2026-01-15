import 'package:go_router/go_router.dart';
import '../models/contact.dart';
import '../pages/contacts_item.dart';
import '../pages/contacts_list.dart';

final List<Contact> contacts = const [
  Contact(
    id: "1",
    name: 'Иван Иванов',
    email: 'example@mail.com',
    phone: '+7 900 111-11-11',
  ),
  Contact(
    id: "2",
    name: 'Пётр Петров',
    email: 'example2@mail.com',
    phone: '+7 900 222-22-22',
  ),
  Contact(
    id: "3",
    name: 'Сидор Сидоров',
    email: 'example3@mail.ru',
    phone: '+7 900 333-33-33',
  ),
  Contact(
    id: "4",
    name: 'Неизвестен',
    email: 'example4@mail.ru',
    phone: '+7 900 444-44-44',
  ),
];

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ContactsScreen(contacts: contacts),
      routes: [
        GoRoute(
          path: 'contact/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final contact = contacts.firstWhere((c) => c.id == id);

            return ContactDetailScreen(contact: contact);
          },
        ),
      ],
    ),
  ],
);
