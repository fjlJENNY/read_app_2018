import 'package:flutter/material.dart';
import 'package:read_app_2018/main_page.dart';

void main() {
  runApp(ReadApp());
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
