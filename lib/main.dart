import 'package:flutter/material.dart';
import 'package:read_app_2018/configs/global_config.dart';
import 'package:read_app_2018/main_page.dart';
import 'package:read_app_2018/utils/sharedPreferencesUtil.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  // fixed ! Make sure to call WidgetsFlutterBinding.ensureInitialized(); before await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = Config.sentryDsn;
  //   },
  //   appRunner: () {
  //     SpUtil.getInstance().then((value) {
  //       runApp(ReadApp());
  //     });
  //   },
  // );

  SpUtil.getInstance().then((value) {
    runApp(ReadApp());
  });
}

class ReadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '大妈阅读器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // 去除 debug
      home: MainPage(),
    );
  }
}
