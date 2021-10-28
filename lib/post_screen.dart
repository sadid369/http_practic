import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  static const routeName = 'post-page';
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
