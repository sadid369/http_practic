import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationBarWid extends StatefulWidget {
  BottomNavigationBarWid({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidState createState() => _BottomNavigationBarWidState();
}

class _BottomNavigationBarWidState extends State<BottomNavigationBarWid> {
  @override
  Widget build(BuildContext context) {
    var _currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bootom'),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
