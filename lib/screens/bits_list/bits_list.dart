import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:jokebook/screens/bits_list/new_bit.dart';

class BitsListPage extends StatefulWidget {
  BitsListPage({Key key}) : super(key: key);

  @override
  BitsListPageState createState() => BitsListPageState();
}

class BitsListPageState extends State<BitsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
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

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return new NewBitPage();
    },
  ));
}