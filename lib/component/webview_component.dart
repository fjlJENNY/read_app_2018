import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';

// webview component
class WebviewComponent extends StatefulWidget {
  WebviewComponent({
    Key? key,
    required this.webviewUrl,
  }) : super(key: key);

  final String webviewUrl;

  @override
  _WebviewComponentState createState() => _WebviewComponentState();
}

class _WebviewComponentState extends State<WebviewComponent> {
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
    return WebView(
      initialUrl: widget.webviewUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {},
      // onProgress:(int progress){print("Webview is loading (progress: $progress)")},   // webview progress
      //  js 调用 flutter 方法
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context)
      },
      navigationDelegate: (NavigationRequest request) {
        // 拦截
        if (request.url.startsWith("https://www.youtube.com")) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
    );
  }

  // toast -
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: "RToast",
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context)
            .showBottomSheet((context) => Text(message.message));
      },
    );
  }
}
