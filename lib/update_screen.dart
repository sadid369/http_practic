import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  static const routeName = 'update-page';

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final priceFocusdNode = FocusNode();

  @override
  void dispose() {
    priceFocusdNode.dispose();
    super.dispose();
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
              child: ListView(
            children: [
              TextFormField(
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
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                focusNode: priceFocusdNode,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton.icon(
                  color: Colors.amber,
                  onPressed: () {},
                  icon: Icon(Icons.done),
                  label: Text('Done Edit')),
            ],
          )),
        ));
  }
}
