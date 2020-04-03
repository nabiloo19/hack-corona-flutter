import 'package:flutter/cupertino.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLangProvider extends ChangeNotifier {
  static final String TAG = "AppLangProvider";
  final String _langCodeKey = 'lang_code';
  final String _langCountryKey = 'lang_country';
  Locale _appLocale = Locale('en', 'US');
  
  /// Get Current Locale
  Locale get appLocale => _appLocale ?? Locale('en');

  /// This method is called during the application first run
  fetchLocale()  async {
    Log.log(TAG, message: "Fetching Locale...");
    var prefs = await SharedPreferences.getInstance();
    if(prefs.getString(_langCodeKey) == null) {
      _appLocale = Locale('en');
      Log.log(TAG, message: "current Locale = $_appLocale");
      return null;
    }
    
    _appLocale = Locale(prefs.get(_langCodeKey));
    Log.log(TAG, message: "current Locale = $_appLocale");
    return null;
  }
  
  /// Change Locale
  void changeLanguage(Locale currentLang) async {
    Log.log('AppLangProvider',message: 'Changing Language to $currentLang');
    var prefs = await SharedPreferences.getInstance();
    if(_appLocale == currentLang) return;
    if(currentLang == Locale('am')) {
      _appLocale  = Locale('am', 'ET');
      await prefs.setString(_langCodeKey, 'am');
      await prefs.setString(_langCountryKey, 'ET');
    }else {
      _appLocale  = Locale('en', 'US');
      await prefs.setString(_langCodeKey, 'en');
      await prefs.setString(_langCountryKey, 'US');
    }
    notifyListeners();
  }
}