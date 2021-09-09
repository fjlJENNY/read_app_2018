import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///  存储List
///
///   List list = [User(name: '张三', id: 1), User(name: '李四', id: 2)];
///   await SpUtil.setItem("user", list);
///   var listStr = SpUtil.getItem("user");
///   var listResult = listStr
///       .map<User>((String item) => User.fromJson(json.decode(item)))
///        .toList();
///
///   print(listResult.runtimeType);
///
///
/// class User {
//   User({
//     required this.id,
//     required this.name,
//   });

//   final int id;
//   final String name;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//       };
// }
///

// ==== 存储 map ===

// Map<String, dynamic> map = {"1": "map", "2": 2};
// await SpUtil.setItem("user", map);

// Map<String, dynamic> map2 =
//     (SpUtil.getItem<Map>("user") as Map<String, dynamic>);
// print(map2.runtimeType);

// === 存储 Set , 获取的 是 List<String>
// Set<String> a = <String>{"s", 'b'};
// await SpUtil.setItem("test", a);

// var d = SpUtil.getItem("test");
// print(d);
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
  //
  // 2种复杂的存储 (1项 StringList , Map)
  // Map 获取的值 使用 getItem<Map>

  // ?? 为什么不用 String , 是为了 String a = SpUtil.getItem(key); // 直接获取对应类型
  static T? getItem<T>(String key) {
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

    if (T == Map) {
      if (value == null) return null;
      resultValue = json.decode(value as String) as Map;
      return resultValue;
    }
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
      case "List<String>":
        resultValue = value as List<String>;
        break;
      default:
        break;
    }
    return resultValue;
  }

  static Future<void> setItem(String key, dynamic value) async {
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
        break;
      // case "List":
      //   // case "List<dynamic>":
      //   List<String> _converValue = (value as List).map((dynamic item) {
      //     String _decodeString = json.encode(item);
      //     return _decodeString;
      //   }).toList();
      //   _prefs!.setStringList(key, _converValue);
      //   break;
      // case "Map":
      //   break;
      default:
        break;
    }

    if (value is Map) {
      String _converValue = json.encode(value);
      _prefs!.setString(key, _converValue);
      return null;
    }

    if (value is List || value is Set) {
      List<String> _converValue = value.map<String>((dynamic item) {
        String _decodeString = json.encode(item);
        return _decodeString;
      }).toList();
      _prefs!.setStringList(key, _converValue);
      return null;
    }
  }
}
