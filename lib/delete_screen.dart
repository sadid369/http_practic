import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_practic/provider.dart';
import 'package:http_practic/update_screen.dart';
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
      setState(() {
        isLoading = false;
      });
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DisplayTitle(itemData: itemData),
    );
  }
}

class DisplayTitle extends StatelessWidget {
  const DisplayTitle({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  final Products itemData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemData.item.length,
      itemBuilder: (ctx, i) => Dismissible(
        onDismissed: (dirc) {
          Provider.of<Products>(context, listen: false)
              .deleteProduct(itemData.item[i].id!);
        },
        key: ValueKey(itemData.item[i].id),
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          color: Colors.red,
        ),
        confirmDismiss: (_) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Are you sure to delete the product'),
                    content: Text('this action delete your product'),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                          child: Text('Yes')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: Text('No'))
                    ],
                  ));
        },
        child: Card(
          child: ListTile(
            leading: Text('${itemData.item[i].price}'),
            title: Text('${itemData.item[i].title}'),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(UpdateScreen.routeName,
                            arguments: itemData.item[i].id);
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        Provider.of<Products>(context, listen: false)
                            .deleteProduct(itemData.item[i].id!);
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
