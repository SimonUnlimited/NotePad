import 'package:first_app/models/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note_item.dart';
import '../providers/note_items.dart';
import '../models/full_note_screen.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleFocusNode = FocusNode();
  final categoryFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();
  var note = NoteItem(
    id: '',
    title: '',
    description: '',
    timeStamp: '01-01-2020',
    category: '',
    isFavorite: false,
  );
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          FullNoteScreen.routeName, arguments: ScreenArguments(),
        );
      }, //ADD HERE
    );
  }
}
