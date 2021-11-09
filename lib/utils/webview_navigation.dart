import 'package:flutter/material.dart';
import 'package:read_app_2018/component/common_page.dart';
import 'package:read_app_2018/component/webview_component.dart';

class H5Page {
  static void navToWebview(
    BuildContext context, {
    required String url,
    required String title,
  }) {
    assert(url.length != 0);
    assert(title.length != 0);

    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext ctx) {
        return CommonPage(
          pageName: title,
          child: WebviewComponent(
            webviewUrl: url,
          ),
        );
      }),
    );
  }
}
