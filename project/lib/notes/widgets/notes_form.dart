import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_provider.dart';

class NotesForm extends StatefulWidget {
  const NotesForm({super.key});

  @override
  State<NotesForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NotesForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Заголовок'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _categoryController,
            decoration: const InputDecoration(labelText: 'Категория'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.read<NoteProvider>().addNote(
                _titleController.text,
                _categoryController.text,
              );

              _titleController.clear();
              _categoryController.clear();
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
