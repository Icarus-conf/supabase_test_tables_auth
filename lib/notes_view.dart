import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final controller = TextEditingController();

  addNewNoteToDatabase() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: controller,
        ),
        actions: [
          TextButton(
            onPressed: () {
              saveNote();
              controller.clear();
              Navigator.pop(context);
            },
            child: const Text("Add note"),
          ),
        ],
      ),
    );
  }

  saveNote() async {
    await Supabase.instance.client
        .from("notes")
        .insert({'body': controller.text});
  }

  final notesStream =
      Supabase.instance.client.from('notes').stream(primaryKey: ['id']);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNoteToDatabase,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: notesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              final noteText = note['body'];
              return Text(noteText);
            },
          );
        },
      ),
    );
  }
}
