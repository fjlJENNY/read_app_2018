import 'package:flutter/material.dart';
import 'package:read_app_2018/main_page.dart';
import 'package:read_app_2018/utils/sharedPreferencesUtil.dart';

void main() {
  // fixed ! Make sure to call WidgetsFlutterBinding.ensureInitialized(); before await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  SpUtil.getInstance().then((value) {
    print('== main ==');
    print(SpUtil.isInitialzed());
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
