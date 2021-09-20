// import 'dart:html';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tst_app/home/home_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

String _title;
String _url;
bool isPageLoaded;

class AppWebView extends StatelessWidget {
  static const route = 'web_view_screen';

  @override
  Widget build(BuildContext context) {
    isPageLoaded = false;

    final Completer<WebViewController> _controller =
        Completer<WebViewController>();
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: ExternalWebViews(
        title: _title,
        initialURL: _url,
        con: _controller,
      ),
    );
  }
}

class ExternalWebViews extends StatefulWidget {
  ExternalWebViews(
      {@required this.title, @required this.initialURL, @required this.con});
  final String title;
  final String initialURL;
  final Completer<WebViewController> con;

  @override
  _ExternalWebViewsState createState() => _ExternalWebViewsState();
}

class _ExternalWebViewsState extends State<ExternalWebViews> {
  @override
  // note to self: you need to use futures with web views bc you will be navigating between sites. Doing this to keep views the same bt android and ios
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _title,
          style: TextStyle(fontSize: 20.0),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child:
                isPageLoaded ? WebNavControls(widget.con.future) : Container(),
          ),
        ],
      ),
      body: WebView(
        initialUrl: _url,
        onWebViewCreated: (WebViewController webViewController) {
          widget.con.complete(webViewController);
        },
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String data) {
          setState(() {
            print('page loaded');
            isPageLoaded = true;
          });
        },
      ),
    );
  }
}

void setPageInfo(String title, String url) {
  print('set page info called');
  _title = title;
  _url = url;
}

class WebNavControls extends StatefulWidget {
  const WebNavControls(this._controllerFuture)
      : assert(_controllerFuture != null);

  final Future<WebViewController> _controllerFuture;

  @override
  _WebNavControlsState createState() => _WebNavControlsState();
}

class _WebNavControlsState extends State<WebNavControls> {
  bool isLButtonDisabled;
  bool isRButtonDisabled;
  @override
  void initState() {
    isLButtonDisabled = true;
    isRButtonDisabled = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: widget._controllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;

        return Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                  color: isLButtonDisabled ? Colors.white38 : Colors.white,
                ),
                onPressed: () async {
                  //cases:
                  // 2. check to see if user can go back twice
                  // 3. check to see if user can go forward twice
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                    // Scaffold.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text('${await controller.currentUrl()}'),
                    //   ),
                    // );

                    if (await controller.canGoBack()) {
                      print('can go back');
                      setState(() {
                        isLButtonDisabled = false;
                        isRButtonDisabled = false;
                      });
                    }
                  } else {
                      print('can\'t go back');
                      setState(() {
                        isLButtonDisabled = true;
                      });
                  }
                }),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18.0,
                color: isRButtonDisabled ? Colors.white38 : Colors.white,
              ),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                        // Scaffold.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('${await controller.currentUrl()}'),
                        //   ),
                        // );
                        if (await controller.canGoForward()) {
                          if (await controller.canGoForward()) {
                            print('can go forward');
                            setState(() {
                              isRButtonDisabled = false;
                              isLButtonDisabled = false;
                            });
                          }
                        }
                      } else {
                          print('can\'t go forward');
                          setState(() {
                            isRButtonDisabled = true;
                          });

                      }
                    },
            ),
          ],
        );
      },
    );
  }
}

// class ShowLinearProgress extends StatefulWidget {
//   const ShowLinearProgress(this._controllerFuture)
//       : assert(_controllerFuture != null);

//   final Future<WebViewController> _controllerFuture;

//   @override
//   _ShowLinearProgressState createState() => _ShowLinearProgressState();
// }

// class _ShowLinearProgressState extends State<ShowLinearProgress> {
//   @override
//   Widget build(BuildContext context) {
//     return Future<WebViewController>();
//   }
// }
