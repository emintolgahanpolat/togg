import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:togg/helper/logger.dart';

class AnalyticsHelper {
  static AnalyticsHelper instance = AnalyticsHelper();
  event(String event, {Map<String, Object?>? parameters}) {
    if (kReleaseMode) {
      FirebaseAnalytics.instance.logEvent(name: event, parameters: parameters);
    } else {
      Log.i(parameters.toString(), tag: "Event : $event");
    }
  }
}
