import 'package:flutter/material.dart';
// import 'package:tst_app/give/give_screen.dart';
// import 'package:tst_app/home/calendar.dart';
// import 'package:tst_app/shared_pages/learn_more.dart';
// import 'package:tst_app/shared_pages/meet_our_board.dart';
import '../home/page_components.dart';
import '../home/gallery.dart';
import '../shared_pages/learn_more.dart';
import '../shared_pages/meet_our_board.dart';
import 'quotes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles.dart';

// final Color placeholderColor = Colors.amber[100];
// final Color textColor = Colors.black54;
// final Color accentColor = Colors.deepOrange[300];
// // final Color textColor = Colors.black87;
// final Color backgroundColor = Color(0xFFFFFBEF);
// final Color contactUsColor = Colors.deepOrange[50];

class HomeScreen extends StatefulWidget {
  static const route = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBackground,
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            appbarColor: lightBrown,
            appbarTitle: 'Home',
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12.0,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //quote
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 30.0, bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Quote of the Day',
                        style: TextStyle(
                          fontSize: 38.0,
                          color: defaultTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Quotes.route);
                        },
                        child: Text(
                          '"The best teachers are those who show your where to look, but don\'t tell you what to see"',
                          style: TextStyle(
                            color: defaultTextColor,
                            fontSize: 20.0,
                            height: 2.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '-Alexandra K. Trenfor',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: defaultTextColor,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                // about us video
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Image.asset(
                              'assets/images/AboutUs_thumbnail.png'),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Container(),
                          // RaisedButton(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //   ),
                          //   elevation: 5.0,
                          //   onPressed: () {
                          //     print("watch video");
                          //   },
                          //   color: Colors.grey[700],
                          //   child: Row(
                          //     children: <Widget>[
                          //       Container(
                          //           child: Icon(
                          //         Icons.play_circle_filled,
                          //         color: Colors.white,
                          //       )),
                          //       SizedBox(width: 5.0),
                          //       Container(
                          //         child: Text(
                          //           'watch',
                          //           style: TextStyle(color: Colors.white),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Our Story',
                            style: TextStyle(
                                color: defaultTextColor,
                                fontSize: 38.0,
                                fontWeight: FontWeight.w300),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: Text(
                              '"We started with teachers in mind. Our hope is to uplift the hearts and minds of teachers and paraprofessionals."',
                              style: TextStyle(
                                color: defaultTextColor,
                                fontSize: 20.0,
                                height: 2.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Juanita Harris',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: defaultTextColor,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'founder',
                                  style: TextStyle(
                                      color: defaultTextColor,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40.0)
                        ],
                      ),
                    ),
                    // meet our board button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MeetOurBoard.route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.users,
                                color: defaultTextColor,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                'Meet our Board',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w300,
                                  color: defaultTextColor,
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.0,
                                color: lightPurple,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                      child: Center(
                        child: Container(
                          color: Colors.black38,
                          width: screenWidth,
                          height: 0.5,
                        ),
                      ),
                    ),
                    // learn more button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LearnMore.route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.question,
                                  color: defaultTextColor,
                                  size: 20.0,
                                ),
                                SizedBox(width: 30.0),
                                Text(
                                  'Learn More',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                    color: defaultTextColor,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 20.0, color: lightPurple)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //gallery
                Padding(
                    padding: EdgeInsets.only(bottom: 30.0, top: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Gallery.route);
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 235.0,
                            color: Colors.deepOrange[300],
                            child: Image.asset(
                              'assets/images/gallery.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.black38,
                            width: double.infinity,
                            height: 235.0,
                          ),
                          Positioned(
                            bottom: 10.0,
                            left: 8.0,
                            child: Row(
                              children: [
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 35.0,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                //coming up
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(),
                  // FlatButton(
                  //   highlightColor: backgroundColor,
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, Calendar.route);
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           'Coming Up',
                  //           style: TextStyle(
                  //               fontSize: 38.0,
                  //               color: textColor,
                  //               fontWeight: FontWeight.w300),
                  //         ),
                  //         SizedBox(
                  //           height: 30.0,
                  //         ),
                  //         Row(
                  //           children: <Widget>[
                  //             Icon(
                  //               FontAwesomeIcons.appleAlt,
                  //               color: textColor,
                  //               size: 22.0,
                  //             ),
                  //             Flexible(
                  //               child: Padding(
                  //                 padding: const EdgeInsets.only(
                  //                     left: 8.0, right: 8.0),
                  //                 child: Text(
                  //                   'DATE  |  EVENT DESCRIPTION',
                  //                   style: TextStyle(
                  //                       fontSize: 20.0,
                  //                       color: textColor,
                  //                       fontWeight: FontWeight.w300),
                  //                   overflow: TextOverflow.ellipsis,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),

                // calendar
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
                  child: Card(
                    elevation: 2,
                    color: Color(0xFFFFF7DB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 395.0,
                      width: double.infinity,
                      child: MonthlyCalendar(),
                    ),
                  ),
                ),

                //social/contact information
                ContactWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
  // FIX - build gallery, quote of the day, calendar
  // FIX - add bottom nav bar to give page
  // TODO - create buttons out of meet our board and learn more
  // TODO -create stretch version for gallery, use one color (not orange. green or blue)
  // TODO - pick prelim color scheme background, accent color, 2nd accent theme [https://material.io/resources/color/#!/?view.left=0&view.right=0]

  // TODO - re-design homescreen w new color scheme, new gallery setup
}


