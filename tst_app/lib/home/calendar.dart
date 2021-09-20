import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tst_app/home/gallery.dart';

const Color backgroundColor = Color(0xFFFFFBEF);
const Color textColor = Colors.black87;

class Calendar extends StatelessWidget {
  static const route = 'calendar';

  @override
  Widget build(BuildContext context) {
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Upcoming Event ${index+1}',
                      style: TextStyle(color: textColor, fontSize: 23.0),
                    ),
                    Text(
                      'Event ${index+1} description',
                      style: TextStyle(color: textColor, fontSize: 15.0),
                    ),
                  ],
                ),
              );
            },),);
  }
}
