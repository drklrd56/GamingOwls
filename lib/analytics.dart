import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AppAnalytics {
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  FirebaseAnalyticsObserver getObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);
  void sendCurrentTabToAnalytics(String screenName, {String tabName}) {
    if (screenName.isNotEmpty)
      getObserver().analytics.setCurrentScreen(
            screenName:
                '${screenName}${tabName != null && tabName.isNotEmpty ? "/$tabName" : ""}',
          );
    print(
      'New analytics => ${screenName}${tabName != null && tabName.isNotEmpty ? "/$tabName" : ""}',
    );
  }
}
