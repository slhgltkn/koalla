import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koalla/others/renkler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewGame extends StatefulWidget {
  const webViewGame({
    super.key,
    required this.gameUrl,
  });
  final String gameUrl;
  @override
  State<webViewGame> createState() => _webViewGameState();
}

class _webViewGameState extends State<webViewGame> {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      statusBarColor: renkler.arkaPlan,
      systemNavigationBarColor: renkler.arkaPlan,
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return WebView(
      initialUrl: widget.gameUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
