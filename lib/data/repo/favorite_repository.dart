import 'dart:async';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/data/protos/poi.pbgrpc.dart';
import 'package:togg/helper/logger.dart';

abstract class IFavoriteRepository {
  List<PoiReply> get favorite;
  void addRemoveFavorite(PoiReply item);
  Stream<PoiReply> streamFavorite();
}

class FavoriteRepository extends IFavoriteRepository {
  final List<PoiReply> _items = [];
  final _streamController = StreamController<PoiReply>();

  @override
  void addRemoveFavorite(PoiReply item) {
    if (_items.contains(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    LocalDataSource.instance.setFavorite(_items);
    _streamController.sink.add(item);
  }

  @override
  Stream<PoiReply> streamFavorite() {
    return _streamController.stream;
  }

  @override
  List<PoiReply> get favorite {
    Log.i(LocalDataSource.instance.favorities.toString(),
        tag: "Fav View Model");
    return LocalDataSource.instance.favorities;
  }
}
