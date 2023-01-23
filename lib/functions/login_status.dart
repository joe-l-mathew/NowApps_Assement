import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

Future<bool> getLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final bool? loginStatus = prefs.getBool(loginKey);
  if (loginStatus == null) {
    await prefs.setBool(loginKey, false);
    return false;
  } else {
    return loginStatus;
  }
}
