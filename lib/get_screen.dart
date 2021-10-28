import 'package:flutter/material.dart';

class GetScreen extends StatelessWidget {
  static const routeName = 'get-page';
  const GetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Screen'),
      ),
      body: Container(
        color: Colors.orange,
      ),
    );
  }
}
