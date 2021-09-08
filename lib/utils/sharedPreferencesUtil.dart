import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static final SpUtil _singleton = SpUtil._();

  SpUtil._();

  factory SpUtil() {
    return _singleton;
  }
}
