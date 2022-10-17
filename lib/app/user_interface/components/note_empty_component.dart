import 'package:flutter/material.dart';
import 'package:notely/app/user_interface/widgets/notely_button.dart';
import 'package:notely/rsc/utils/margins/y_margin.dart';
import '../screens/create_a_note_screen.dart';

class NoteEmptyComponent extends StatelessWidget {
  const NoteEmptyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/note_empty_state.png',
                  height: 221,
                ),
              ),
              const YMargin(39),
              const Text(
                'Create your first note',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF403b36),
                ),
              ),
              const YMargin(12),
              const Text(
                'Add a note about anything (your thoughts on climate change, '
                'or your history essay) and share it with the world.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF595550),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        NotelyButton(
          text: 'Create A Note',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const CreateANoteScreen(),
              ),
            );
          },
        ),
        const YMargin(20),
        const Text(
          'Import Notes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFFD9614C),
          ),
        )
      ],
    );
  }
}
