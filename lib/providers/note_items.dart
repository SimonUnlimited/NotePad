import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NoteItem {
  final String id;
  final String title;
  final String timeStamp;
  final String description;
  final String category;
  bool isFavorite;

  NoteItem(
      {this.id,
      this.title,
      this.category,
      this.description,
      this.timeStamp,
      this.isFavorite});
}

class NoteItems with ChangeNotifier {
  List<NoteItem> noteList = [
  ];

  List<NoteItem> get noteitems {
    return [...noteList];
  }

  Future<void> fetchNotes() async {
    
    const url = 'https://notepad2-ca6eb.firebaseio.com/notes.json';
    try {
      final response = await http.get(url);
      List<NoteItem> notes = [];
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      data.forEach((noteId, noteData) {
        notes.add(NoteItem(
          id: noteId,
          title: noteData['title'],
          description: noteData['description'],
          category: noteData['category'],
          timeStamp: noteData['timeStamp'],
          isFavorite: noteData['isFavorite'],
        ));
      });
      noteList = notes;
      notifyListeners();
    } 
    catch (err) {

    }
  }

  Future<void> addNote(NoteItem newNote) async {
    const url = 'https://notepad2-ca6eb.firebaseio.com/notes.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': newNote.id,
          'title': newNote.title,
          'timeStamp': newNote.timeStamp,
          'description': newNote.description,
          'category': newNote.category,
          'isFavorite': newNote.isFavorite,
        }),
      );
      final note = NoteItem(
        id: jsonDecode(response.body)['name'],
        title: newNote.title,
        description: newNote.description,
        category: newNote.category,
        isFavorite: newNote.isFavorite,
        timeStamp: newNote.timeStamp,
      );
      noteList.add(note);
      notifyListeners();
    } catch (err) {
      print('error');
      throw err;
    }
    
  }

  void removeNote(String noteId) {
    noteList.removeWhere((note) => note.id == noteId);
    notifyListeners();
  }
}

// add method
//set method
//other methods
