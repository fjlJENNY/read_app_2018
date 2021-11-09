import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:read_app_2018/utils/webview_navigation.dart';

// # 关于我们
class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  static const String routeName = '/about_us';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String _version = '1.0.0';

  @override
  void initState() {
    super.initState();
  }

  void navPrivacyProtocol() {
    H5Page.navToWebview(context,
        url: "https://ilawpush5.aegis-info.com/exemption", title: "隐私协议");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterLogo(size: 60),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("当前版本$_version"),
                    ),
                  ],
                ),
              ),
              Divider(),
              _buildItem(iconWidget: Icon(Icons.access_alarm), text: "推荐给朋友"),
              _buildItem(
                  iconWidget: Icon(Icons.access_alarm),
                  text: "去App Store下载更新或评论"),
              _buildItem(iconWidget: Icon(Icons.access_time), text: "浏览历史"),
              _buildItem(iconWidget: Icon(Icons.access_alarm), text: "意见反馈"),
              _buildItem(iconWidget: Icon(Icons.access_alarm), text: "免责声明"),
              _buildItem(
                  iconWidget: Icon(Icons.access_alarm),
                  text: "用户隐私政策",
                  onPressed: navPrivacyProtocol),
              _buildItem(iconWidget: Icon(Icons.access_alarm), text: "关于"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
      {required Icon iconWidget,
      required String text,
      bool needDivider = true,
      VoidCallback? onPressed}) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          height: 55,
          child: Column(
            children: [
              // 每行
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        iconWidget,
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(text),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.navigate_next),
                    )
                  ],
                ),
              ),

              needDivider ? Divider() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
