import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_blocpattern/blocs/favorite_bloc.dart';
import 'package:youtube_blocpattern/blocs/videos_bloc.dart';
import 'package:youtube_blocpattern/screens/home.dart';

import 'api.dart';

void main() {

  Api api = Api();
  api.search("Flutter estudos");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'youtubeFlutter',
        home: Home(),

      ),
      blocs: [
        Bloc((i) => VideosBloc()),
        Bloc((i) => FavoriteBloc()),
      ],
    );
  }
}



// MaterialApp(
// debugShowCheckedModeBanner: false,
// title: 'youtube',
// home: Home(),
//
// ),

