import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_project/core/utilities/constant/const_value.dart';

class SharedPreferenceApp {
  SharedPreferences? _sharedPreferencesStorePlatform;
  Future<SharedPreferences> init() async {
    _sharedPreferencesStorePlatform = await SharedPreferences.getInstance();
    return _sharedPreferencesStorePlatform!;
  }
  // ! get data

  Future<String?> getLang() async {
    return await getStringData(key: AppConstValue.lang);
  }

  Future<int?> getTheme() async {
    return await getIntData(key: AppConstValue.theme);
  }

  // ! set data

  Future<void> setLang({required Locale lang}) async {
    await setStringData(data: lang.languageCode, key: AppConstValue.lang);
  }

  Future<void> setTheme({required Brightness theme}) async {
    await setIntData(data: theme.index, key: AppConstValue.theme);
  }

// ! shared function
  // * Set string
  Future<void> setStringData(
      {required String data, required String key}) async {
    _sharedPreferencesStorePlatform ??= await init();
    _sharedPreferencesStorePlatform!.setString(key, data);
  }

  Future<void> setIntData({required int data, required String key}) async {
    _sharedPreferencesStorePlatform ??= await init();
    _sharedPreferencesStorePlatform!.setInt(key, data);
  }

  Future<String?> getStringData({required String key}) async {
    _sharedPreferencesStorePlatform ??= await init();
    return _sharedPreferencesStorePlatform!.getString(key);
  }

  Future<int?> getIntData({required String key}) async {
    _sharedPreferencesStorePlatform ??= await init();
    return _sharedPreferencesStorePlatform!.getInt(key);
  }

  Future<void> deleteData({required String key}) async {
    _sharedPreferencesStorePlatform ??= await init();
    _sharedPreferencesStorePlatform!.remove(key);
  }
}
