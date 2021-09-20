import 'package:flutter/material.dart';
// import 'package:tst_app/home/calendar.dart';
import 'package:tst_app/home/home_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';

class Articles extends StatelessWidget {
  static const route = 'articles_screen';

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: backgroundColor,
        title: Text(
          'Digital Resources',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverList(delegate: Sliverchil)
        ],
      ),
    );
  }
}
