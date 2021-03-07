import 'package:flutter/material.dart';
import 'package:youtube_blocpattern/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'youtube',
      home: Home(),
    );
  }
}

