import "package:flutter/material.dart";

// # 书架
class BookShelf extends StatefulWidget {
  BookShelf({Key? key}) : super(key: key);

  @override
  _BookShelfState createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("书架"),
      ),
    );
  }
}
