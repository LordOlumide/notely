import 'package:flutter/material.dart';

class CreateANoteScreen extends StatelessWidget {
  const CreateANoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Create a note',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            Expanded(
              child: TextFormField(
                minLines: 10,
                maxLines: 100,
                decoration: const InputDecoration(
                  hintText: 'Content',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
