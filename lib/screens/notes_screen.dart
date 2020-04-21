import 'package:first_app/screens/managa_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/notes.dart';
import '../providers/note_items.dart';
import '../widgets/AddNote.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  FocusNode titleFocusNode;
  FocusNode descriptionFocusNode;

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.toc),
          onTap: () => print('Categories Selected'),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (val) {
              if (val == 'Edit') {
                
              } else if (val == 'Manage Categories') {
                Navigator.pushNamed(context, ManageCategoriesScreen.routeName);
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Edit'),
                value: 'Edit',
              ),
              PopupMenuItem(
                child: Text('Manage Categories'),
                value: 'Manage Categories',
              ),
            ],
          )
        ],
      ),
      floatingActionButton: AddNote(),
      body: Notes(),
    );
  }
}
