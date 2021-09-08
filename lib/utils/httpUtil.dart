import "package:dio/dio.dart";

// 单例模式
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._();

  int i = 0;

  HttpUtil._() {
    print("i::: ${i++}");
  }

  factory HttpUtil() {
    return _instance;
  }

  // Future<T>? get(){

  // }

  BaseOptions options = BaseOptions(
    // 连接服务器超时时间 ， 单位是毫秒
    connectTimeout: 10000,
  );

  Dio dio = Dio();
}
