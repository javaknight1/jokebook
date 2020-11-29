// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'List of Bits',
      style: optionStyle,
    ),
    Text(
      'List of Sets',
      style: optionStyle,
    ),
    Text(
      'Your Gig History',
      style: optionStyle,
    ),
    Text(
      'Account Settings',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc),
            label: 'Bits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Sets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.margin),
            label: 'Gig History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
