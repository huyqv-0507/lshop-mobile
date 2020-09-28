import 'package:laptop_mobile/extensions/env/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceExtension {
  SharedPreferences _prefs;

  Future<bool> isLogin() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      //throwing an exception if it's not a String.
      _prefs.getString(Env().tokenPrefs);
      return true;
    } catch (Exception) {
      return false;
    }
  }

  Future<bool> setToken(String token) async {
    _prefs = await SharedPreferences.getInstance();
    return await _prefs.setString(Env().tokenPrefs, token);
  }

  Future<bool> logOut() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.clear();
  }
}

//Instance of SharedPreferenceExtension
final SharedPreferenceExtension sharedPreferenceExtension =
    SharedPreferenceExtension();
