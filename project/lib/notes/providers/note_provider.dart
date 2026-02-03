import 'package:flutter/material.dart';

import '../models/note.dart';

class NoteProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => List.unmodifiable(_notes);

  void addNote(String title, String category) {
    if (title.isEmpty || category.isEmpty) return;

    _notes.add(Note(title: title, category: category));

    notifyListeners();
  }

  void removeNote(int index) {
    if (index < 0 || index >= _notes.length) return;

    _notes.removeAt(index);
    notifyListeners();
  }
}
