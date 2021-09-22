import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_app_2018/pages/about/about_page.dart';
import 'package:read_app_2018/pages/book_classify/book_classify_page.dart';
import 'package:read_app_2018/pages/book_mall/book_mall_page.dart';
import 'package:read_app_2018/pages/book_shelf/book_shelf_page.dart';
import 'package:read_app_2018/utils/sharedPreferencesUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 主界面

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget>? pages;
  // 底部 navigation bar
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store),
      label: "商店",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store),
      label: "分类",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store),
      label: "书架",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store),
      label: "我的",
    ),
  ];

  int _activeIndex = 0; // active index

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [
        BookMall(),
        BookClassify(),
        BookShelf(),
        AboutUs(),
      ];
    }

    testSharedPreferences();
  }

  testSharedPreferences() async {
    Set<String> a = <String>{"s", 'b'};
    await SpUtil.setItem("test", a);

    var d = SpUtil.getItem<Set>("test");
    print(d);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 获取 pagesWidget
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _activeIndex != index,
      child: TickerMode(
        // 清除动画
        enabled: _activeIndex == index,
        child: Container(
          color: Colors.blue,
          child: pages![index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            _getPagesWidget(0),
            _getPagesWidget(1),
            _getPagesWidget(2),
            _getPagesWidget(3),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: _activeIndex,
          onTap: (int index) {
            setState(() {
              _activeIndex = index;
            });
          },
          elevation: 0,
          fixedColor: Colors.red,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          selectedFontSize: 14,
          unselectedFontSize: 14,
        ),
      ),
    );
  }
}

class User {
  User({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
