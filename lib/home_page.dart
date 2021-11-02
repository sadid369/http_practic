import 'package:flutter/material.dart';
import 'package:http_practic/bottom_navigation_bar.dart';
import 'package:http_practic/delete_screen.dart';
import 'package:http_practic/get_screen.dart';
import 'package:http_practic/post_screen.dart';
import 'package:http_practic/update_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        onTap: (i) {
          // if (i == 0) {
          //   Navigator.of(context).pushNamed(DeleteScreen.routeName);
          // } else if (i == 1) {
          //   Navigator.of(context).pushNamed(GetScreen.routeName);
          // } else if (i == 2) {
          //   Navigator.of(context).pushNamed(UpdateScreen.routeName);
          // }

          print(i);

          setState(() {
            index = i;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
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
