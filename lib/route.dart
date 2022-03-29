import 'package:flutter/material.dart';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/helper/analytics_helper.dart';
import 'package:togg/locator.dart';
import 'package:togg/page/favorite/favorite.dart';
import 'package:togg/page/home/home.dart';
import 'package:togg/page/login/login.dart';

extension RouteSettingsEx on RouteSettings {
  T routeArgs<T>() => arguments as T;
}

class AppRoute {
  static GlobalKey<NavigatorState> applicationKey = GlobalKey<NavigatorState>();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    late WidgetBuilder widgetBuilder;
    AnalyticsHelper.instance.event("Route",
        parameters: {"arguments": (routeSettings.arguments.toString())});
    switch (routeSettings.name) {
      case "/":
        widgetBuilder = (_) => const HomePage();
        break;
      case "login":
        widgetBuilder = (_) => const LoginPage();
        break;
      case "/favorites":
        widgetBuilder = (_) => const FavoritePage();
        break;

      default:
        widgetBuilder =
            (_) => const Material(child: Center(child: Text("Unknown")));
    }

    return MaterialPageRoute(builder: widgetBuilder);
  }
}
