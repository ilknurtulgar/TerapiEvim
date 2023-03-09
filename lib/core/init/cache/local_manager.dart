import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/enum/local_keys_enum.dart';

class LocalManager {
  static final LocalManager _instance = LocalManager._init();

  SharedPreferences? _preferences;

  static LocalManager get instance => _instance;

  LocalManager._init() {
    SharedPreferences.getInstance().then((value) => _preferences = value);
  }

  ///Be careful to first call 'preferencesInit' in initialization
  ///step to make sure that _preferences is not null
  static Future<void> preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(LocalManagerKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setNullableStringValue(
      LocalManagerKeys key, String? value) async {
    if (value == null) return;
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(LocalManagerKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setNullableBoolValue(LocalManagerKeys key, bool? value) async {
    if (value == null) return;
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> setIntValue(LocalManagerKeys key, int value) async {
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> setNullableIntValue(LocalManagerKeys key, int? value) async {
    if (value == null) return;
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> setDoubleValue(LocalManagerKeys key, double value) async {
    await _preferences!.setDouble(key.toString(), value);
  }

  Future<void> setNullableDoubleValue(
      LocalManagerKeys key, double? value) async {
    if (value == null) return;
    await _preferences!.setDouble(key.toString(), value);
  }

  Future<void> removeValue(LocalManagerKeys key) async {
    await _preferences!.remove(key.toString());
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  String getStringValue(LocalManagerKeys key) =>
      _preferences!.getString(key.toString()) ?? '';

  String? getNullableStringValue(LocalManagerKeys key) =>
      _preferences!.getString(key.toString());

  bool? getBoolValue(LocalManagerKeys key) =>
      _preferences!.getBool(key.toString());

  int? getIntValue(LocalManagerKeys key) =>
      _preferences!.getInt(key.toString());

  double? getDoubleValue(LocalManagerKeys key) =>
      _preferences!.getDouble(key.toString());
}
