import 'package:flutter/material.dart';
import 'package:http_practic/provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  static const routeName = 'post-page';

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _priceFocusdNode = FocusNode();
  final _fromKey = GlobalKey<FormState>();
  var _existingProduct = Product(id: null, title: '', price: 0);

  @override
  void dispose() {
    _priceFocusdNode.dispose();
    super.dispose();
  }

  Future<void> _saveFrom() async {
    _fromKey.currentState?.save();
    Provider.of<Products>(context, listen: false).addItem(_existingProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _fromKey,
              child: ListView(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      _existingProduct = Product(
                          id: _existingProduct.id,
                          title: value!,
                          price: _existingProduct.price);
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'title'),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocusdNode);
                    },
                  ),
                  TextFormField(
                    onSaved: (value) {
                      _existingProduct = Product(
                          id: _existingProduct.id,
                          title: _existingProduct.title,
                          price: double.parse(value!));
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: 'price'),
                    focusNode: _priceFocusdNode,
                    onFieldSubmitted: (_) {
                      _saveFrom();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton.icon(
                      color: Colors.amber,
                      onPressed: () {
                        _saveFrom();
                      },
                      icon: Icon(Icons.done_all_outlined),
                      label: Text('Submit'))
                ],
              )),
        ));
  }
}
