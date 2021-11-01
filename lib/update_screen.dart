import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http_practic/provider.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  static const routeName = 'update-page';

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final priceFocusdNode = FocusNode();
  final _fromKey = GlobalKey<FormState>();
  var _existingProduct = Product(id: null, title: '', price: 0);
  var _intialValue = {
    'title': '',
    'price': 0,
  };
  @override
  void dispose() {
    priceFocusdNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final productID = ModalRoute.of(context)!.settings.arguments;
    if (productID == null) {
      return;
    }
    _existingProduct = Provider.of<Products>(context, listen: false)
        .filterItembyID(productID.toString());
    _intialValue = {
      'title': _existingProduct.title!,
      'price': _existingProduct.price.toString(),
    };
    super.didChangeDependencies();
  }

  Future<void> updateProduct() async {
    _fromKey.currentState!.save();
    await Provider.of<Products>(context, listen: false)
        .updateData(_existingProduct.id!, _existingProduct)
        .then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _fromKey,
              child: ListView(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      _existingProduct = Product(
                          id: _existingProduct.id,
                          title: value,
                          price: _existingProduct.price);
                    },
                    initialValue: _intialValue['title'].toString(),
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(priceFocusdNode);
                    },
                  ),
                  TextFormField(
                    onSaved: (value) {
                      _existingProduct = Product(
                          id: _existingProduct.id,
                          title: _existingProduct.title,
                          price: double.parse(value!));
                    },
                    initialValue: _intialValue['price'].toString(),
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    focusNode: priceFocusdNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      updateProduct();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton.icon(
                      color: Colors.amber,
                      onPressed: () {
                        updateProduct();
                      },
                      icon: Icon(Icons.done),
                      label: Text('Done Edit')),
                ],
              )),
        ));
  }
}
