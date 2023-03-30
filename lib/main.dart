import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Future<String> get _url async {
    await Future.delayed(const Duration(seconds: 8));
   
             //place your twak api code here
    return '';
  }

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  final String title = "Char Support";

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Twak SMS'),
        ),
        body: FutureBuilder(
            future: MyApp._url,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return WebView(
                  initialUrl:
                      'https://tawk.to/chat/642588d331ebfa0fe7f58cf8/1gsp9t059',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController controller) {
                    _controller.complete(controller);
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const Text('Loading');
              }
            }));
  }
}
