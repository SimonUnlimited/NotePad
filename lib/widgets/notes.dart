import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_items.dart';
import 'single_note.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteItems>(context);
    noteProvider.fetchNotes();
    final noteData = noteProvider.noteList;   //gets List of all notes from note_items
    return ListView.builder(
      itemCount: noteData.length,
      itemBuilder: (ctx, i) {
        return SingleNote(
            title: noteData[i].title,
            description: noteData[i].description,
            id: noteData[i].id,
            category: noteData[i].category,
            timeStamp: noteData[i].timeStamp,
        );
      }
      
    );
  }
}