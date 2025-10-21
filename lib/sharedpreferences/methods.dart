import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? pref;

  SharedPref._privateConstructor();

  static final SharedPref _instance = SharedPref._privateConstructor();

  static SharedPref get getInstance => _instance;

  Future<void> initSharedPref() async {
    if (pref == null) {
      getInstance.pref = await SharedPreferences.getInstance();
    }
  }

  void setName(String key, String name) {
    getInstance.pref!.setString(key, name);
  }

  Future<String?> getName(String key) async {
    return getInstance.pref!.getString(key);
  }
}
