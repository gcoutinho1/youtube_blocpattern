import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_blocpattern/blocs/videos_bloc.dart';
import 'package:youtube_blocpattern/delegates/data_search.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/youtubelogo.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.red,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: VideosBloc().outVideos,
        // stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(itemBuilder: null);
          else
            return Container();
        },
      ),
    );
  }
}
