import "package:dio/dio.dart";

// 单例模式
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._();

  late Dio dio;

  BaseOptions defaultOptions = BaseOptions(
    // 连接服务器超时时间 ， 单位是毫秒
    connectTimeout: 5000, // 5s 连接超时
    receiveTimeout: 3000, // 3s 接受超时
  );

  HttpUtil._() {
    dio = Dio(defaultOptions);
  }

  factory HttpUtil() {
    return _instance;
  }

  /// get 请求
  Future<Response?> get({
    required String url,
    Map<String, dynamic>? queryParames,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.get(
        url,
        queryParameters: queryParames,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print("Get question 错误::: $e");
      return null;
    }
  }

  /// post 请求
  Future<Response?> post({
    required url,
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool useUrlEncode = false, // 使用 application/x-www-form-urlencoded
  }) async {
    try {
      if (useUrlEncode) {
        options ??= Options();
        options =
            options.copyWith(contentType: Headers.formUrlEncodedContentType);
      }
      Response response = await dio.post(
        url,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      print("Get question 错误::: $e");
      return null;
    }
  }

  // ==
  // FormData.fromMap({});
  // ==
  /// upload 上传
  Future<void>? upload() {
    return null;
  }
}

// const factory MapEntry() => MapEntry._;
