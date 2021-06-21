import 'package:flutter/material.dart';
import './app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Todo\'s',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: App(),
    );
  }
}
