import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_blocpattern/models/video.dart';
import 'dart:async';

class FavoriteBloc implements BlocBase {

  Map<String, Video> favorites = {};

  //.seedd(1) example seedValue
  // alterei streamController para BehaviorSubject para o app detectar os icones dos vídeos salvos como favoritos
  final  _favController = BehaviorSubject<Map<String, Video>>();

  Stream<Map<String, Video>> get outFav => _favController.stream;

  FavoriteBloc() {
    SharedPreferences.getInstance().then((prefs) {
      // prefs.clear();
      if (prefs.getKeys().contains("favorites")) {
        favorites = json.decode(prefs.getString("favorites")).map((k, v) {
          return MapEntry(k, Video.fromJson(v));
        }).cast<String, Video>();
        _favController.add(favorites);
      }
    });
  }

  @override
  void dispose() {
    _favController.close();
  }

  void toggleFavorite(Video video) {
    if (favorites.containsKey(video.id))
      favorites.remove(video.id);
    else
      favorites[video.id] = video;

    _favController.sink.add(favorites);
    _saveFavorite();
  }

  void _saveFavorite(){
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("favorites", json.encode(favorites));
    });
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
