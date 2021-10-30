import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_practic/provider.dart';
import 'package:provider/provider.dart';

class DeleteScreen extends StatefulWidget {
  static const routeName = 'delete-page';

  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  var isLoading = false;
  @override
  void initState() {
    isLoading = true;
    Provider.of<Products>(context, listen: false)
        .fatchData()
        .catchError((error) {
      print(error);
    }).then((_) {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Products>(context);
    print('${itemData.item.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Screen'),
      ),
      body: ListView.builder(
        itemCount: itemData.item.length,
        itemBuilder: (ctx, i) => Card(
          child: ListTile(
            leading: Text('${itemData.item[i].price}'),
            title: Text('${itemData.item[i].title}'),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
