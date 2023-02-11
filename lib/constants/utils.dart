import 'package:shared_preferences/shared_preferences.dart';
class Utils{
  static String? token_generate;
  static int? aplicationId;


  static Future<void> saveUserAuth(bool bool) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('IS_REGISTERED', bool);
  }

  static Future<bool?> getUserAuth() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('IS_REGISTERED');
  }

  static Future<void> savePinCode(int pinCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('SAVE_PIN_CODE', pinCode);
  }

  static Future<int?> getPinCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('SAVE_PIN_CODE');
  }
  

}