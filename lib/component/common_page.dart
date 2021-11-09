import "package:flutter/material.dart";
import 'package:read_app_2018/component/common_scaffold.dart';

/// 通用的页面
class CommonPage extends StatefulWidget {
  CommonPage({
    Key? key,
    required this.child,
    required this.pageName,
  }) : super(key: key);

  final String pageName;
  final Widget child;

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: RScaffold(
        title: widget.pageName,
        body: widget.child,
      ),
    );
  }
}
