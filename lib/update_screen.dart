import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  static const routeName = 'update-page';
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Screen'),
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
