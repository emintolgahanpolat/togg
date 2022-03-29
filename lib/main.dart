import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/locator.dart';
import 'package:togg/page/favorite/favorite_vm.dart';
import 'package:togg/route.dart';

void main() async {
  await GetStorage.init();
  setupLocator();

  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => locator<FavoriteViewModel>()..listen())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LocalDataSource.instance.token == null ? "login" : "/",
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
