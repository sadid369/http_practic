import 'package:flutter/material.dart';
import 'package:http_practic/delete_screen.dart';
import 'package:http_practic/get_screen.dart';
import 'package:http_practic/home_page.dart';
import 'package:http_practic/post_screen.dart';
import 'package:http_practic/update_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PostScreen.routeName: (ctx) => PostScreen(),
        UpdateScreen.routeName: (ctx) => UpdateScreen(),
        DeleteScreen.routeName: (ctx) => DeleteScreen(),
        GetScreen.routeName: (ctx) => GetScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
