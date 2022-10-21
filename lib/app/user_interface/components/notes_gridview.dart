import 'package:flutter/material.dart';
import 'note_item_Component.dart';
import '../../model/note.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: notes.length,
      itemBuilder: (_, index) => NoteItemComponent(),
    );
  }
}