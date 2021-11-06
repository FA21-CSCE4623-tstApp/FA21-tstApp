import 'package:flutter/material.dart';
import '../styles.dart';
import '../home/home_screen.dart';


final Color backgroundColor = Color(0xFFFFFBEF);

class TeacherHacks extends StatelessWidget {
  static const route = 'teacher_hacks_screen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: backgroundColor,
        title: Text(
          'Teacher Hacks',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 40.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    '\$23.00',
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0, top: 8.0, bottom: 8.0),
                                    child: Text(
                                      'Donation',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 15.0,
                                    ),
                                    child: Text(
                                      'August 1, 2020',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 15.0,
                                    ),
                                    child: Text(
                                      'Donated via CashApp',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.info,
                                  size: 35.0, color: Colors.black26)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Container(
                              height: 1.0,
                              width: screenWidth,
                              color: lightPurple,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
