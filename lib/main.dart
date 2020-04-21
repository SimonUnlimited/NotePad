import 'package:first_app/models/full_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/notes_screen.dart';
import './providers/note_items.dart';
import './screens/managa_categories_screen.dart';
import './models/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void generateRoute() {

  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NoteItems(),
        ),
      ],
      child: MaterialApp(
        title: 'NotePad',
        theme: ThemeData(
            primaryColor: Colors.orange[300],
            fontFamily: 'Roboto',
            accentColor: Colors.blueGrey[400],
            textTheme: TextTheme()),
        home: NotesScreen(),
        initialRoute: '/',
        routes: 
        //onGenerateRoute: ,
        {
         ManageCategoriesScreen.routeName: (ctx) => ManageCategoriesScreen(),
         FullNoteScreen.routeName: (ctx) => FullNoteScreen(),
        },
      ),
    );
  }
}
