import 'dart:convert';

import 'package:e_commerce/core/data/models/login_info.dart';
import 'package:e_commerce/core/data/models/token_info.dart';
import 'package:e_commerce/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/shared_preference_data_type.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = prefs;

  //!---- Keys  ------

  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_LOGGEDIN = 'logged_in';
  String PREF_LOGININFO = 'logininfo';
  String PREF_TOKENINFO = 'TOKENINFO';
  String PREF_APP_LANG = 'app_language';

  void setFirstLunch(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(PREF_FIRST_LUNCH))
      return getPrefrence(PREF_FIRST_LUNCH);
    else
      return true;
  }
//-----------------------------------------------------------------

  void setLoggedIn(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_LOGGEDIN, value: value);
  }

  bool getLoggedIn() {
    if (pref.containsKey(PREF_LOGGEDIN))
      return getPrefrence(PREF_LOGGEDIN);
    else
      return false;
  }

  //----------------------------------------------------------------

  void setlogininfo(LoginInfo value) {
    setPrefrenc(
        type: DataType.STRING,
        key: PREF_LOGININFO,
        value: jsonEncode(value.toJson()));
  }

  LoginInfo getlogininfo() {
    if (pref.containsKey(PREF_LOGININFO)) {
      return LoginInfo.fromJson(jsonDecode(getPrefrence(PREF_LOGININFO)));
    } else
      return LoginInfo(isCheked: false);
  }

  //----------------------------------------------------------------

  void settokeninfo(TokenInfo value) {
    setPrefrenc(
        type: DataType.STRING,
        key: PREF_TOKENINFO,
        value: jsonEncode(value.toJson()));
  }

  TokenInfo gettokeninfo() {
    if (pref.containsKey(PREF_TOKENINFO)) {
      return TokenInfo.fromJson(jsonDecode(getPrefrence(PREF_TOKENINFO)));
    } else
      return TokenInfo();
  }

  //----------------------------------------------------------------

  void setAppLanguage(String code) {
    setPrefrenc(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  String getAppLanguage() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getPrefrence(PREF_APP_LANG);
    } else {
      return 'en';
    }
  }

  //*====================================

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }
}
