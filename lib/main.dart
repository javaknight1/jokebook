import 'package:flutter/material.dart';
import 'package:jokebook/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jokebook',
        theme: ThemeData(
          primaryColor: Colors.amber.shade800,
        ),
        home: HomePage());
  }
}