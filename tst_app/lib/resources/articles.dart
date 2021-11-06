import 'package:flutter/material.dart';
import '../styles.dart';

class Articles extends StatelessWidget {
  static const route = 'articles_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: lightBrown,
        title: Text(
          'Digital Resources',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: [

        ],
      ),
    );
  }
}
