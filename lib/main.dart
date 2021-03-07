import 'package:flutter/material.dart';
import 'package:youtube_blocpattern/screens/home.dart';

import 'api.dart';

void main() {
  Api api = Api();
  api.search("eletro");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'youtube',
      home: Home(),

    );
  }
}

