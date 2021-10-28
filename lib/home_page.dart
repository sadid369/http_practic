import 'package:flutter/material.dart';
import 'package:http_practic/delete_screen.dart';
import 'package:http_practic/get_screen.dart';
import 'package:http_practic/post_screen.dart';
import 'package:http_practic/update_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP PRACTICE'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PostScreen.routeName);
            },
            icon: Icon(Icons.post_add_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(DeleteScreen.routeName);
            },
            icon: Icon(Icons.delete_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(UpdateScreen.routeName);
            },
            icon: Icon(Icons.update),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(GetScreen.routeName);
            },
            icon: Icon(Icons.get_app),
          ),
        ],
      ),
    );
  }
}
