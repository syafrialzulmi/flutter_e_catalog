import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  Future<String> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
    return token;
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token')!;
  }

  Future<bool> isToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token') != null;
  }
}
