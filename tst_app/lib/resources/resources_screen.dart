import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home/page_components.dart';
import '../resources/all_events.dart';
import 'TeacherBulletin/teacher_bulletin.dart';
import '../resources/teacher_hacks.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles.dart';
// TODO: create a file to house inspire me section

class ResourcesScreen extends StatelessWidget {
  static String route = 'resources_screen';

  @override
  Widget build(BuildContext context) {
    List colors = [Color(0xff9c64a6), Color(0xff836fa9), Color(0xffe1bee7)];
    List images = [
      "assets/images/teacher_bulletin/apple.png",
      "assets/images/teacher_bulletin/block.png",
      "pencil_crayon.png"
    ];
    List<String> tagSuggestions = <String>[
      'High School',
      'Middle School',
      'College',
      'Elementary',
      'Teacher Hacks',
      'Lunch Ideas',
      'Holiday Season',
      'Decoration Ideas',
      "K4",
    ];

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
                      const Text(
                        'Helpful Info',
                        style: TextStyle(
                          fontSize: 33.0,
                          color: defaultTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 20.0),
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
                            const Icon(FontAwesomeIcons.laptopCode,
                                color: defaultIconColor, size: 21.0),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Text('Digital Resources',
                                style: TextStyle(
                                    fontSize: 18.0, color: defaultTextColor)),
                            Expanded(child: Container()),
                            const Icon(Icons.arrow_forward_ios,
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
                            const Icon(Icons.event_note,
                                color: defaultIconColor, size: 23.0),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Text('All Events',
                                style: TextStyle(
                                    fontSize: 18.0, color: defaultTextColor)),
                            Expanded(child: Container()),
                            const Icon(Icons.arrow_forward_ios,
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
                            const Icon(Icons.celebration_outlined,
                                color: defaultIconColor, size: 26.0),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Text('#CelebrateWithUs',
                                style: TextStyle(
                                    fontSize: 18.0, color: defaultTextColor)),
                            Expanded(child: Container()),
                            const Icon(Icons.arrow_forward_ios,
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
                          children: const [
                            Text(
                              'Teacher\'s Bulletin',
                              style: TextStyle(
                                color: defaultTextColor,
                                fontSize: 37.0,
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
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
                          children: const [
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
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, bottom: 10.0, top: 20.0),
                      child: Text(
                        'Highlights',
                        style:
                            TextStyle(fontSize: 32.0, color: defaultTextColor),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 40.0),
                      child: Text(
                        'find resources by topic',
                        style:
                            TextStyle(fontSize: 16.0, color: defaultTextColor),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, itemCount) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: colors[itemCount % 2],
                                  ),
                                  width: 250.0,
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(images[itemCount % 2],
                                        height: 200.0),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      tagSuggestions[itemCount],
                                      style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(2.0, 4.0),
                                              blurRadius: 8.0,
                                              color: Colors.black54,
                                            ),
                                          ],
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                // height: 50.0,
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                //shows the user TST photos/posts
                GestureDetector(
                  onTap: () {
                    const url = 'https://wesupportteachers.com/contact-us';
                    launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset('assets/images/ConnectWithUs.JPG'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ContactWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
