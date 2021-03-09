import 'dart:async';

import 'package:youtube_blocpattern/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_blocpattern/models/video.dart';

class VideosBloc implements BlocBase {

  Api api;

  List<Video> videos;
  final StreamController _videosController = StreamController();

  Stream get outVideos => _videosController.stream;
  final StreamController _searchController = StreamController();

  Sink get inSearch => _searchController.sink;

  VideosBloc(this.api) {
    _searchController.stream.listen((_search);

    }

  void _search(String search) async {
    videos = await api.search(search);
    print(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
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