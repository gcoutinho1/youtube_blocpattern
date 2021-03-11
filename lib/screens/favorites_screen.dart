import 'package:flutter/material.dart';
import 'package:youtube_blocpattern/blocs/favorite_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_blocpattern/models/video.dart';

class FavoritesScreen extends StatelessWidget {

  final bloc = BlocProvider.getBloc<FavoriteBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<Map<String, Video>>(
        stream: bloc.outFav,
        initialData: {},
        builder: (context, snapshot){
              return ListView(
                children: snapshot.data.values.map((v){
                  return InkWell(
                    onTap: (){

                    },
                    onLongPress: (){
                      bloc.toggleFavorite(v);
                    },
                    child: Row(
                      //verificar removendo <Widget>
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 50,
                          child: Image.network(v.thumb),
                        ),
                        Expanded(child: Text(v.title, style: TextStyle(color: Colors.white),
                        maxLines: 2,))
                      ],
                    ),
                  );
                }).toList(),
              );
        },
      ),
    );
  }
}
