import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BitsListPage extends StatefulWidget {
  BitsListPage({Key key}) : super(key: key);

  @override
  BitsListPageState createState() => BitsListPageState();
}

class BitsListPageState extends State<BitsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
      child: new Center(
        child: new FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/bits_example.json'),
          builder: (context, snapshot) {
            var bits = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: bits.length,
              itemBuilder: (context, index) {
                var bit = bits[index];
                return ListTile(
                  title: Text(bit["name"]),
                );
              },
            );
          }
        ),
      ),
    ));
  }
}
