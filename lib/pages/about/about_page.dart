import 'package:flutter/material.dart';

// # 关于我们
class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  static const String routeName = '/about_us';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("关于我们")),
    );
  }
}
