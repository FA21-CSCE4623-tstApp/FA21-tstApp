import 'package:flutter/material.dart';
// import 'package:tst_app/home/home_screen.dart';
// import 'package:tst_app/home/calendar.dart';
// import 'package:tst_app/home/gallery.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tst_app/home/calendar.dart';
import 'package:tst_app/home/page_components.dart';
import 'package:tst_app/resources/articles.dart';
import 'package:tst_app/resources/past_events.dart';
import 'package:tst_app/resources/teacher_hacks.dart';

// final Color placeholderColor = Colors.amber[100];
final Color textColor = Colors.black54;
final Color _accentColor = Color(0xFFe6ba53);
// final Color textColor2 = Colors.amber[40];
final Color backgroundColor = Color(0xFFFFFBEF);

class ResourcesScreen extends StatelessWidget {
  static String route = 'resources_screen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFBEF),
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            appbarColor: Colors.deepPurple[200],
            appbarTitle: 'Resources',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Helpful Info',
                        style: TextStyle(
                          fontSize: 33.0,
                          color: textColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: textColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Articles.route);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.laptopCode,
                                color: _accentColor, size: 21.0),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('Digital Resources',
                                style: TextStyle(fontSize: 18.0)),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,
                                color: _accentColor, size: 18.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: textColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PastEvents.route);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.event_note,
                                color: _accentColor, size: 23.0),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('All Events',
                                style: TextStyle(fontSize: 18.0)),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,
                                color: _accentColor, size: 18.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: textColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, TeacherHacks.route);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.lightbulb_outline,
                                color: _accentColor, size: 23.0),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('#TeacherHacks',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400)),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,
                                color: _accentColor, size: 18.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: textColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      color: Color(0xfff352f41),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 18.0),
                        child: Container(
                            child: Image.asset(
                          'assets/images/bulletin-board.png',
                        )),
                      ),
                    ),
                    Positioned(
                      top: 65.0,
                      left: 40.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teacher\'s Bulletin',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 37.0,
                            ),
                          ),
                          SizedBox(height: 25.0,),
                          Container(
                            width: 200.0,
                            child: Text(
                              'Learn and ask questions with other educators',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 80.0,
                      right: 40.0,
                      child: Row(
                        children: [
                          Text('see how', style: TextStyle(color: textColor)),
                          SizedBox(width: 5.0),
                          Icon(Icons.arrow_forward_ios, size: 10.0, color: textColor,)
                        ],
                      ),),
                  ],
                ),
                // shows the user TST's videos/event info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 40.0, top: 20.0),
                      child: Text(
                        'Featured',
                        style: TextStyle(fontSize: 23.0, color: textColor),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, itemCount){
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                              ),
                              width: 250.0,
                              // height: 50.0,
                            ),
                          );
                        },
                      ),),
                  ],
                ),
                //shows the user TST photos/posts
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Container(
                      color: Colors.blue,
                      height: 230.0,
                      width: double.infinity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}