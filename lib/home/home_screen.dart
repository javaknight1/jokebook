// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:jokebook/bits_list/bits_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _widgetOptions = [
    new BitsListPage(),
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
      // appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
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

  Widget _myListView() {

    // backing data
    final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria', 
      'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
      'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
      'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
      'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
      'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
      'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
      'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
      'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

    return ListView.builder(
      itemCount: europeanCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(europeanCountries[index]),
        );
      },
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
