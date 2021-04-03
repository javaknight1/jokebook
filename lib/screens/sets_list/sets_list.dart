import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:jokebook/screens/sets_list/new_set.dart';

class SetsListPage extends StatefulWidget {
  SetsListPage({Key key}) : super(key: key);

  @override
  SetsListPageState createState() => SetsListPageState();
}

class SetsListPageState extends State<SetsListPage> {
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
          future: DefaultAssetBundle.of(context).loadString('assets/sets_example.json'),
          builder: (context, snapshot) {
            var sets = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: sets.length,
              itemBuilder: (context, index) {
                var set = sets[index];
                return ListTile(
                  title: Text(set["name"]),
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
      return new NewSetPage();
    },
  ));
}