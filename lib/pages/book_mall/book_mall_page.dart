import "package:flutter/material.dart";

// # 商城

class BookMall extends StatefulWidget {
  BookMall({Key? key}) : super(key: key);

  @override
  _BookMallState createState() => _BookMallState();
}

class _BookMallState extends State<BookMall> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("商城"),
      ),
    );
  }
}
