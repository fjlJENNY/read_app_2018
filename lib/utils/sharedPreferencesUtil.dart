import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static final SpUtil _singleton = SpUtil._();

  static List<String> whiteList = []; // 白名单，清除是否使用白名单

  SpUtil._() {
    if (!isInitialzed()) {
      _init();
    }
  }

  // 工厂模式 | 需要追加 await
  // factory SpUtil() {
  //   return _singleton;
  // }

  static SharedPreferences? _prefs;

  static Future<SpUtil> getInstance() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
      return SpUtil._();
    }

    return _singleton;
  }

  static bool isInitialzed() {
    return _prefs != null;
  }

  static Future<void> _init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return null;
  }

  /// future clear
  static Future<void> clear({bool useWhiteList = false}) async {
    await _init();
    // use  white list
    if (useWhiteList) {
      Set<String> _keys = _prefs!.getKeys();
      for (String key in _keys) {
        if (!whiteList.contains(key)) {
          _prefs!.remove(key);
        }
      }
    } else {
      _prefs!.clear();
    }
  }

  static Future<bool> hasKey(String key) async {
    await _init();
    return _prefs!.containsKey(key);
  }

  // # 移除某项
  static Future<bool> removeItem(String key) async {
    await _init();

    bool _isExist = await hasKey(key);

    if (_isExist) {
      return _prefs!.remove(key);
    }

    return false;
  }

  //#  获取存储 key 的 length
  static int get length {
    if (!isInitialzed()) {
      return 0;
    }
    return _prefs!.getKeys().length;
  }

  // # 获取 Item
  // 4项 基础数据  int double , String , bool ,
  // 1项 StringList
  // ?? 为什么不用 String , 是为了 String a = SpUtil.getItem(key); // 直接获取对应类型
  static getItem(String key) {
    if (!isInitialzed()) {
      assert(() {
        if (_prefs == null) {
          throw FlutterError("shared_preferences 初始化失败 , Function getItem");
        }
        return true;
      }());
      return null;
    }
    Object? value = _prefs!.get(key);
    String valueType = value.runtimeType.toString();
    dynamic resultValue;
    switch (valueType) {
      case "int":
        resultValue = value as int;
        break;
      case "double":
        resultValue = value as double;
        break;
      case "bool":
        resultValue = value as bool;
        break;
      case "String":
        resultValue = value as String;
        break;
    }
    return resultValue;
  }

  static Future setItem(String key, Object value) async {
    await _init();
    String valueType = value.runtimeType.toString();
    switch (valueType) {
      case "int":
        _prefs!.setInt(key, value as int);
        break;
      case "double":
        _prefs!.setDouble(key, value as double);
        break;
      case "bool":
        _prefs!.setBool(key, value as bool);
        break;
      case "String":
        _prefs!.setString(key, value as String);
    }
  }
}
