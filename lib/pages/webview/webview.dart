// ================= Web View Page =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({required this.url, Key? key}) : super(key: key);
  final String url;

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (GetPlatform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  void _removeLoading(String _) {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.transparent,),
      body: LoadingOverlay(
        isLoading: _isLoading,
        color: Get.theme.primaryColor,
        progressIndicator: CircularProgressIndicator(color: Get.theme.iconTheme.color),
        child: WebView(
          initialUrl: widget.url,
          onPageStarted: _removeLoading,
        ),
      ),
    );
  }
}
