import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tst_app/home/gallery.dart';

class LearnMore extends StatelessWidget {
  static const route = 'learn_more_screen';

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width - 80.0;
    final double height = MediaQuery.of(context).size.height - 120.0;
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height),
        child: Container(
          width: 30.0,
          height: 30.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: textColor,
            child: Icon(
              FontAwesomeIcons.times,
              size: 15.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Learn more description',
              style: TextStyle(
                color: textColor,
                fontSize: 23.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
