// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;
  _getBgColorByTheme() {
    final ThemeData theme = Theme.of(context);
    if (theme.brightness == Brightness.light) {
      return const Color(0xffffffff);
    } else {
      return const Color(0xff262626);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.wooyeons.site/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0), //height of appbar
          child: AppBar(
              backgroundColor: _getBgColorByTheme() //appbar background color
              )),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
