import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:togg/data/repo/home_repository.dart';
import 'package:togg/route.dart';

class HomeViewModel with ChangeNotifier {
  final IHomeRepository _repository;
  HomeViewModel(this._repository);
  late GoogleMapController controller;

  listen() {
    _repository.getPois().listen((event) {
      addPoiReply(event);
    }).onError((e) {
      if ((e as GrpcError).code == 16) {
        LocalDataSource.instance.setToken(null);
        if (AppRoute.applicationKey.currentContext != null) {
          Navigator.pushReplacementNamed(
              AppRoute.applicationKey.currentContext!, "login");
        }
      }
    });
  }

  final List<PoiReply> _items = [];
  List<PoiReply> get items => _items;
  void addPoiReply(PoiReply item) {
    _items.add(item);
    notifyListeners();
  }
}
