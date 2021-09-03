import "package:flutter/material.dart";

// # 商品分类
class BookClassify extends StatefulWidget {
  BookClassify({Key? key}) : super(key: key);

  static const String routeName = "/book_classify";

  @override
  _BookClassifyState createState() => _BookClassifyState();
}

class _BookClassifyState extends State<BookClassify> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("分类"),
      ),
    );
  }
}
