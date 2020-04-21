import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_items.dart';
import '../models/full_note_screen.dart';
import '../models/screen_arguments.dart';

class SingleNote extends StatelessWidget {
  final String id;
  final String title;
  final String timeStamp;
  final String description;
  final String category;
  bool isFavorite;

  SingleNote(
      {this.id,
      this.title,
      this.timeStamp,
      this.description,
      this.category,
      this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: theme.textTheme.title,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      timeStamp,
                      style: TextStyle(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/full-note',
            arguments: ScreenArguments(
              id: id,
              title: title,
              description: description,
            ));
      },
    );
  }
}
