

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class AppWebView extends StatefulWidget {
  const AppWebView({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {



  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  late final WebViewController controller;



  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
        child: WebViewWidget(
            controller: controller,
        ),
    ),
  );

}
