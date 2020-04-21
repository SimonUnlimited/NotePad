import 'package:flutter/material.dart';

class ManageCategoriesScreen extends StatefulWidget {
  static const routeName = 'ManageCategories';

  @override
  _ManageCategoriesScreenState createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        title: Opacity(
          opacity: .5,
          child: Text(
            'Manage Categories',
          ),
        ),
      ),
      body: Center(
        child: Text('you manage categories here'),
      ),
    );
  }
}
