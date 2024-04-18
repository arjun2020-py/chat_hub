import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  setStringPrf(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   await pref.setString('emailKey', email);
   print('email = ${email}');
  }

  getStringPrf() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return  pref.getString('emailKey');
  }
}
