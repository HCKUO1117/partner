import 'package:flutter/material.dart';
import 'package:partner/utils/preferences.dart';
import 'app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  Preferences.init();
  runApp(App());
}
