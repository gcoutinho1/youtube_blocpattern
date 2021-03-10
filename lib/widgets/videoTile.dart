import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_blocpattern/blocs/favorite_bloc.dart';
import 'package:youtube_blocpattern/models/video.dart';

class VideoTile extends StatelessWidget {

  final Video video;


  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.getBloc<FavoriteBloc>();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0/9.0,
            child: Image.network(video.thumb, fit: BoxFit.cover,),
          ),
          Row(
            children: <Widget> [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Padding(padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Text(
                        video.title,
                        style: TextStyle(color: Colors.white,
                            fontSize: 16),
                      ),
                      ),
                      Padding(padding: EdgeInsets.all(8),
                        child: Text(
                            video.channel ?? 'sem channel',
                          style: TextStyle(color: Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
              ),
              StreamBuilder<Map<String, Video>>(
                stream: bloc.outFav,
                initialData: {},
                builder: (context, snapshot){
                  if(snapshot.hasData)
                    return IconButton(
                        icon: Icon(snapshot.data.containsKey(video.id) ? Icons.star : Icons.star_border),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: (){
                            bloc.toggleFavorite(video);
                        }
                        );
                  else
                    return CircularProgressIndicator();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
