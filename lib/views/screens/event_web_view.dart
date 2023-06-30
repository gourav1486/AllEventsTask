import 'package:all_events_project/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventWebView extends StatelessWidget {
  final String title;
  final String eventUrl;
  EventWebView({Key? key, required this.eventUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0 ,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 0.9 * MediaQuery.of(context).size.height,
            child: WebView(
              initialUrl: eventUrl,
            ),
          ),
        )
      ]),
    );
  }
}
