import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String data) async {
    await prefs?.setString(key, data);
  }

  static String getString(String key, String defaultValue) {
    return prefs?.getString(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int data) async {
    await prefs?.setInt(key, data);
  }

  static int getInt(String key, int defaultValue) {
    return prefs?.getInt(key) ?? defaultValue;
  }

  static Future<void> setDouble(String key, double data) async {
    await prefs?.setDouble(key, data);
  }

  static double getDouble(String key, double defaultValue) {
    return prefs?.getDouble(key) ?? defaultValue;
  }

  // ignore: avoid_positional_boolean_parameters
  static Future<void> setBool(String key, bool data) async {
    await prefs?.setBool(key, data);
  }

  // ignore: avoid_positional_boolean_parameters
  static bool getBool(String key, bool defaultValue) {
    return prefs?.getBool(key) ?? defaultValue;
  }

  static Future<void> setStringList(String key, List<String> data) async {
    await prefs?.setStringList(key, data);
  }

  static List<String> getStringList(String key, List<String> defaultValue) {
    return prefs?.getStringList(key) ?? defaultValue;
  }

  static Future<bool>? remove(String key) {
    return prefs?.remove(key);
  }
}
