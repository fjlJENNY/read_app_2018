import 'package:flutter/material.dart';

// 通用的 page scaffold
class RScaffold extends StatelessWidget {
  RScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.needBackButton = true,
    this.navigatorBackBehavior,
    this.backgroundColor,
    this.extendBodyBehindAppBar,
    this.extendBody,
    this.resizeToAvoidBottomInset,
    this.primary,
    this.actions,
  }) : super(key: key);

  final Widget body;
  final String title;
  final bool needBackButton; // 是否需要  返回按钮
  final VoidCallback? navigatorBackBehavior; //  返回按钮 回调
  final Color? backgroundColor; // 页面背景色
  final bool? extendBodyBehindAppBar; // body 高度 包括 AppBar
  final bool? extendBody; // body 高度包括 bottomNavigationBar
  final bool? resizeToAvoidBottomInset;
  final bool? primary; // appBar 的高度将扩展屏幕状态栏的高度
  final List<Widget>? actions; // actions

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: needBackButton
            ? navigatorBackBehavior != null
                ? BackButton(
                    onPressed: navigatorBackBehavior,
                  )
                : BackButton() // 有个返回按钮
            : null,
        title: Text(title),
        actions: actions,
      ),
      body: body,
      backgroundColor: backgroundColor ?? Colors.white,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      extendBody: extendBody ?? false,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      primary: primary ?? true,
    );
  }
}
