import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_blocpattern/models/video.dart';
import 'dart:async';

class FavoriteBloc implements BlocBase{

  Map <String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favController = StreamController<Map<String, Video>>.broadcast();
  Stream <Map<String, Video>> get outFav => _favController.stream;


  @override
  void dispose() {
    _favController.close();

  }

  void toggleFavorite(Video video){
    if(_favorites.containsKey(video.id)) _favorites.remove(video.id);
    else _favorites[video.id] = video;

    _favController.sink.add(_favorites);

  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }



}