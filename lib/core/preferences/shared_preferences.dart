import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static SharedManager _instance = SharedManager._init();
  SharedPreferences? _preferences;
  static SharedManager get instance => _instance;

  SharedManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> setStringValue(String key, String value) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setIntValue(String key, int value) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    await _preferences!.setInt(key.toString(), value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    await _preferences!.setBool(key.toString(), value);
  }

  Future<String?> getStringValue(String key) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    return _preferences!.getString(key.toString());
  }

  Future<int?> getIntValue(String key) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    return _preferences!.getInt(key.toString());
  }

  Future<bool?> getBoolValue(String key) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    return _preferences!.getBool(key.toString());
  }

  Future<void> remove(String key) async {
    if (_preferences == null) _preferences = await SharedPreferences.getInstance();
    await _preferences!.remove(key);
  }
}
