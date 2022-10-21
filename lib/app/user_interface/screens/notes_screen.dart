import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notely/app/providers/notes_provider.dart';
import 'package:notely/app/cubits/auth/auth_cubit.dart';
import '../components/notes_gridview.dart';
import '../components/note_empty_component.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotesProvider>().subscribeToNotes();
  }

  @override
  void dispose() {
    context.read<NotesProvider>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final authCubit = context.read<AuthCubit>();
            await FirebaseAuth.instance.signOut();
            authCubit.checkAuth();
          },
          icon: SvgPicture.asset(
            'assets/svgs/navigation_drawer_svg.svg',
            color: Colors.black,
          ),
        ),
        title: const Text(
          'All Notes',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Color(0xFF403B36),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svgs/search_svg.svg',
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Consumer<NotesProvider>(
            builder: (_, provider, __) => AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeInOut,
              child: provider.notes.isEmpty
                  ? const NoteEmptyComponent()
                  : NotesGridView(notes: provider.notes),
            ),
          ),
        ),
      ),
    );
  }
}
