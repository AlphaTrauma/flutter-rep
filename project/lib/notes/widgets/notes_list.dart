import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_provider.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = context.watch<NoteProvider>();

    if (noteProvider.notes.isEmpty) {
      return const Center(child: Text('Заметок нет'));
    }

    return ListView.builder(
      itemCount: noteProvider.notes.length,
      itemBuilder: (context, index) {
        final note = noteProvider.notes[index];

        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.category),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context.read<NoteProvider>().removeNote(index);
            },
          ),
        );
      },
    );
  }
}
