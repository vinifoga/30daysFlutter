import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF333333),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Apple\'s Website'),
            centerTitle: true,
            elevation: 0,
          ),
          body: WebView(
            initialUrl: "https://www.apple.com/",
            onWebViewCreated: (controller) => _controller.complete(controller),
          ),
          bottomNavigationBar: Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, right: 20),
              child: ButtonBar(
                children: [
                  navigationButton(Icons.arrow_back_ios,
                      (controller) => _goBack(controller)),
                  navigationButton(Icons.arrow_forward_ios,
                      (controller) => _goFoward(controller)),
                ],
              ),
            ),
          )),
    );
  }

  Widget navigationButton(
      IconData icon, Function(WebViewController) onPressed) {
    return FutureBuilder(
        future: _controller.future,
        builder: (context, AsyncSnapshot<WebViewController> snapshot) {
          return IconButton(
              icon: Icon(icon),
              onPressed: () => onPressed(snapshot.requireData));
        });
  }

  void _goBack(WebViewController controller) async {
    final canGoBack = await controller.canGoBack();
    if (canGoBack) {
      controller.goBack();
    }
  }

  void _goFoward(WebViewController controller) async {
    final canGoForward = await controller.canGoForward();
    if (canGoForward) {
      controller.goForward();
    }
  }
}
