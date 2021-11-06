import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home/page_components.dart';
import '../resources/all_events.dart';
import 'TeacherBulletin/teacher_bulletin.dart';
import '../resources/teacher_hacks.dart';
import '../styles.dart';
// TODO: create a file to house inspire me section

class ResourcesScreen extends StatelessWidget {
  static String route = 'resources_screen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // use this fcn to navigate bt diff screens
    void navigateTo(String route) {
      Navigator.pushNamed(context, route);
    }

    return Scaffold(
      backgroundColor: appBackground,
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            appbarColor: lightBrown,
            // use this as part of secondary color set (e.g. indigo)
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
                          color: defaultTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: defaultTextColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => navigateTo(AllEvents.route),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.laptopCode,
                                color: defaultIconColor, size: 21.0),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('Digital Resources',
                                style: TextStyle(fontSize: 18.0, color: defaultTextColor)),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,
                                color: defaultIconColor, size: 18.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: defaultTextColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => navigateTo(AllEvents.route),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.event_note,
                                color: defaultIconColor, size: 23.0),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('All Events',
                                style: TextStyle(fontSize: 18.0, color: defaultTextColor)),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,
                                color: defaultIconColor, size: 18.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: defaultTextColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => navigateTo(TeacherHacks.route),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.lightbulb_outline,
                                color: defaultIconColor, size: 23.0),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('#TeacherHacks',
                                style: TextStyle(
                                    fontSize: 18.0, color: defaultTextColor)),
                            Expanded(child: Container()),
                            Icon(Icons.arrow_forward_ios,
                                color: defaultIconColor, size: 18.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          color: defaultTextColor,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => navigateTo(TeacherBulletin.route),
                  child: Stack(
                    children: [
                      Container(
                        // color: Color(0xfff352f41),
                        color: appBackground,
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
                            const Text(
                              'Teacher\'s Bulletin',
                              style: TextStyle(
                                color: defaultTextColor,
                                fontSize: 37.0,
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              width: 200.0,
                              child: Text(
                                'Learn and ask questions with other educators',
                                style: TextStyle(
                                    color: defaultTextColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
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
                            Text('see how',
                                style: TextStyle(color: defaultTextColor)),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10.0,
                              color: defaultIconColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
                        style:
                            TextStyle(fontSize: 23.0, color: defaultTextColor),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, itemCount) {
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
                      ),
                    ),
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
                ContactWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
