import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyHeight = 'height';
  static const _keyWeight = 'weight';
  static const _keyAge = 'age';
  
  static late SharedPreferences _prefs;
  
  
  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveUserData(double height, double weight, int age) {
    _prefs.setDouble(_keyHeight, height);
    _prefs.setDouble(_keyWeight, weight);
    _prefs.setInt(_keyAge, age);
  }

  static Map<String, dynamic> loadUserData() {
    return {
      'height': _prefs.getDouble(_keyHeight),
      'weight': _prefs.getDouble(_keyWeight),
      'age': _prefs.getInt(_keyAge),
    };
  }
}