import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koalla/others/renkler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewVideo extends StatefulWidget {
  const webViewVideo({
    super.key,
    required this.link,
  });
  final String link;
  @override
  State<webViewVideo> createState() => webViewVideoState();
}

class webViewVideoState extends State<webViewVideo> {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: renkler.arkaPlan,
      systemNavigationBarColor: renkler.arkaPlan,
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return WebView(
      initialUrl: widget.link,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
