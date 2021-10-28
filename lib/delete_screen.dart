import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  static const routeName = 'delete-page';
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Screen'),
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
