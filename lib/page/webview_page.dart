import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScoreTable extends StatefulWidget {
  final String res;
  ScoreTable  ({required this.res});

  @override
  _ScoreTableState createState() => _ScoreTableState();
}

class _ScoreTableState extends State<ScoreTable> {
  WebViewController? _controller;
  bool isl = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              if (await _controller!.canGoBack()) {
                _controller!.goBack();
              }
              return false;
            },
            child: WebView(
              initialUrl: widget.res,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },

              gestureNavigationEnabled: true,
            ),
          );
        }),
      ),
    );
  }
}