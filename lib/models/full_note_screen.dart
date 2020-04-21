import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note_item.dart';
import '../providers/note_items.dart';
import '../models/screen_arguments.dart';

class FullNoteScreen extends StatefulWidget {
  static const String routeName = '/full-note';

  String title;
  String description;
  String id;

  FullNoteScreen({this.title = '', this.description = '', this.id = ''});

  @override
  _FullNoteScreenState createState() => _FullNoteScreenState();
}

class _FullNoteScreenState extends State<FullNoteScreen> {
  TextEditingController titleController;
  TextEditingController descriptionController;
  FocusNode titleFocus;
  FocusNode descriptionFocus;
  String finalTitle;
  String finalDescription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget noteBodyBuilder({title = '', description = ''}) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            padding: EdgeInsets.only(bottom: 10, top: 20, right: 20, left: 20),
            margin: EdgeInsets.only(bottom: 10, top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black54,
                ),
              ),
            ),
            child: GestureDetector(
              child: TextField(
                maxLength: 45,
                focusNode: titleFocus,
                controller: titleController,
                onChanged: (value) {
                  widget.title = value;
                  
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //Add notification when max number of characters reached for title
                  counterText: '',
                  hintText: 'Enter Title',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () {
                print('here');
                FocusScope.of(context).requestFocus(titleFocus);
              },
            ),
          ),
          Container(
            child: GestureDetector(
              child: TextField(
                focusNode: descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: descriptionController,
                onChanged: (value) {
                  widget.description = value;
                },
                decoration: InputDecoration.collapsed(hintText: ''),
              ),
              onTap: () {
                print('here2');
                FocusScope.of(context).requestFocus(descriptionFocus);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final noteData = Provider.of<NoteItems>(context, listen: false);

    widget.title = args.title;
    widget.id = args.id;
    widget.description = args.description;
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            child: FlatButton(
              onPressed: () {
                if (widget.id == '') {
                  try {
                  noteData.addNote(NoteItem(
                      title: widget.title,
                      description: widget.description,
                      timeStamp: DateTime.now().toString(),
                      id: DateTime.now().toString()));
                  }
                  catch (err) {

                  }
                } else {
                  try {
                  noteData.removeNote(widget.id);
                  noteData.addNote(NoteItem(
                      title: widget.title,
                      id: widget.id,
                      description: widget.description,
                      timeStamp: DateTime.now().toString()));
                }
                catch (err) {

                }
                }
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body:
          noteBodyBuilder(title: widget.title, description: widget.description),
    );
  }
}
