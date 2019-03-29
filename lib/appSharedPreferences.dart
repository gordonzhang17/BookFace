import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {

  Future<String> getLoggedInUsername() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("username") ?? "";
  }

  Future<String> getLoggedInPassword() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("password") ?? null;

  }

  Future<bool> setLoggedInUsername(String username) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString("username", username);

  }

  Future<bool> setLoggedInPassword(String password) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString("password", password);

  }

}