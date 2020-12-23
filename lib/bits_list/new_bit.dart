import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewBitPage extends StatefulWidget {
  NewBitPage({Key key}) : super(key: key);

  @override
  NewBitPageState createState() => NewBitPageState();
}

class NewBitPageState extends State<NewBitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new bit")
      ),
      body: new Container(
        child: new Center(),
      )
    );
  }
}
