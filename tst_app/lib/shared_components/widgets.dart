import 'package:flutter/material.dart';
import '../styles.dart';

// shows a page with progress indicator instead of content
// (e.g. screen with Resource title and a progress indicator)
Widget loadingIndicator({String title = ""}) {
  // TODO: add a timeout
  return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: lightBrown,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20.0, color: defaultTextColor),
        ),
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(30.0)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Colors.white38,
              ),
            )),
      ));
}

// shows a blank container with loading screen
// used in main.dart
Widget secondaryLoadingIndicator() {
  // TODO: add a timeout
  return Container(
    color: appBackground,
    child: Center(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(30.0)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Colors.white38,
            ),
          )),
    ),
  );
}

// shows a loading indicator for individual widgets
Widget smallLoadingIndicator() {
  // TODO: add a timeout
  return SizedBox(
    height: 100.0,
    child: Center(
      child: Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(30.0)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Colors.white38,
            ),
          )),
    ),
  );
}

Widget cancelWidget() {
  return const Icon(
    Icons.cancel,
    color: darkBrown,
    size: 38.0,
  );
}
