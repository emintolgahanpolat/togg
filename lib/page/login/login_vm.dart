import 'package:flutter/material.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:togg/data/protos/poi.pbgrpc.dart';
import 'package:togg/data/repo/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final IAuthRepository _authRepository;
  LoginViewModel(this._authRepository);
  bool __isLoading = false;
  bool get isLoading => __isLoading;
  void setLoading(bool loading) {
    __isLoading = loading;
    notifyListeners();
  }

  String? _username = "Test";
  String? get username => _username;
  void setUsername(String? username) {
    _username = username;
    notifyListeners();
  }

  String? _password = "Togg";
  String? get password => _password;
  void setPassword(String? password) {
    _password = password;
    notifyListeners();
  }

  Future<String?> login() async {
    setLoading(true);
    try {
      var res = await _authRepository
          .login(LoginRequest(username: username, password: password));
      setLoading(false);
      return res.token;
    } on Exception catch (e) {
      setLoading(false);
      throw Exception(e);
    }
  }
}
