import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:togg/data/repo/auth_repository.dart';
import 'package:togg/data/repo/favorite_repository.dart';
import 'package:togg/page/favorite/favorite_vm.dart';
import 'package:togg/page/login/login_vm.dart';

class FakeFavoriteRepository implements IFavoriteRepository {
  final _streamController = StreamController<PoiReply>();
  final List<PoiReply> _items = [];
  final FakeLocalDataSource _dataSource;
  FakeFavoriteRepository(this._dataSource);
  @override
  void addRemoveFavorite(PoiReply item) {
    if (_items.contains(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    _dataSource.setFavorite(_items);
  }

  @override
  List<PoiReply> get favorite => _dataSource._items;

  @override
  Stream<PoiReply> streamFavorite() {
    return _streamController.stream;
  }
}

class FakeLocalDataSource implements LocalDataSource {
  String? _token;
  List<PoiReply> _items = [];
  @override
  List<PoiReply> get favorities => _items;

  @override
  Future<void> setFavorite(List<PoiReply> items) {
    _items = items;
    return Future.value();
  }

  @override
  Future<void> setToken(String? token) {
    _token = token;
    return Future.value();
  }

  @override
  String? get token => _token;
}

class FakeAuthRepository implements IAuthRepository {
  @override
  Future<LoginReply> login(LoginRequest request) {
    if (request.username == "Test" && request.password == "Togg") {
      return Future.value(LoginReply(token: ""));
    }
    return Future.value(LoginReply(token: null));
  }
}

void main() {
  group("Data Test", () {
    test("Favorite Test", () {
      var fakeLocalDataSource = FakeLocalDataSource();
      var favoriteRepository = FakeFavoriteRepository(fakeLocalDataSource);
      var favoriteVM = FavoriteViewModel(favoriteRepository)..listen();
      var fav1 = PoiReply(name: "1");
      favoriteVM.addRemoveFavorite(fav1);

      expect(favoriteRepository._items.contains(fav1), true);
      favoriteVM.addRemoveFavorite(fav1);
      expect(favoriteRepository._items.contains(fav1), false);
    });

    test("Login Test ", () async {
      WidgetsFlutterBinding.ensureInitialized();
      var authRepository = FakeAuthRepository();
      var loginVM = LoginViewModel(authRepository);
      loginVM.setUsername("Test");
      loginVM.setPassword("Togg");
      var res = await loginVM.login();
      expect(res != null, true);
      loginVM.setUsername("Test2");
      loginVM.setPassword("Togg2");
      var res2 = await loginVM.login();
      expect(res2 == null || res2.isEmpty, true);
    });
  });
}
