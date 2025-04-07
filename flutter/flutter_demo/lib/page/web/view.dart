import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class webView extends StatefulWidget {
  const webView({super.key});

  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => {startToText(context)},
                child: const Text("WebView"),
              ),
            ],
          ),
        );
      }),
    );
  }

  startToText(BuildContext context) {}
}
