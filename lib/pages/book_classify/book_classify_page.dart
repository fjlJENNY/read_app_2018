import "package:flutter/material.dart";
import 'package:read_app_2018/pages/book_classify/classify_list.dart';
import 'package:read_app_2018/widgets/book_item.dart';
import 'package:read_app_2018/widgets/book_shelf_item.dart';

// # 商品分类
class BookClassify extends StatefulWidget {
  BookClassify({Key? key}) : super(key: key);

  static const String routeName = "app://BookClassify";

  @override
  _BookClassifyState createState() => _BookClassifyState();
}

class _BookClassifyState extends State<BookClassify> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: ClassifyList(),

        // CustomScrollView(
        //   slivers: [
        //     // # classify 分类类型
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           return ClassifyList();
        //         },
        //         childCount: 1,
        //       ),
        //     ),
        //     // #
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           final int itemIndex = index ~/ 2;
        //           if (index.isEven) {
        //             return BookShelfItem();
        //           }
        //           return Divider();
        //         },
        //         childCount: 20 * 2 - 1,
        //         semanticIndexCallback: (Widget widget, int localIndex) {
        //           if (localIndex.isEven) {
        //             return localIndex ~/ 2;
        //           }
        //           return null;
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
