import 'package:flutter/material.dart';

import '../widgets/notes_form.dart';
import '../widgets/notes_list.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заметки')),
      body: Column(
        children: const [
          NotesForm(),
          Divider(),
          Expanded(child: NotesList()),
        ],
      ),
    );
  }
}
