import 'package:flutter/material.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:togg/data/repo/favorite_repository.dart';
import 'package:togg/helper/logger.dart';

class FavoriteViewModel extends ChangeNotifier {
  final IFavoriteRepository _favoriteRepository;
  FavoriteViewModel(this._favoriteRepository);

  final List<PoiReply> _items = [];
  List<PoiReply> get items => _items;

  addRemoveFavorite(PoiReply poiReply) {
    _favoriteRepository.addRemoveFavorite(poiReply);
  }

  listen() {
    _items.addAll(_favoriteRepository.favorite);

    Log.i(_favoriteRepository.favorite.toString(), tag: "Fav View Model");
    notifyListeners();
    _favoriteRepository.streamFavorite().listen((event) {
      if (items.contains(event)) {
        _items.remove(event);
      } else {
        _items.add(event);
      }
      notifyListeners();
    });
  }
}
