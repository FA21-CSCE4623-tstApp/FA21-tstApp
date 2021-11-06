import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared_pages/in_app_web.dart';
import 'package:intl/intl.dart';
import '../styles.dart';

class MonthlyEvent extends StatelessWidget {
  static const route = 'monthlyEvent_screen';

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var dateInfo = DateTime.now();
    var currentMonth = DateFormat.MMMM().format(dateInfo);
    return Scaffold(
      backgroundColor: appBackground,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: screenHeight - 100),
        child: Container(
          width: 30.0,
          height: 30.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              FontAwesomeIcons.times,
              size: 15.0,
            ),
            backgroundColor: defaultTextColor,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Image.asset(
                    'assets/images/TeachersLounge.jpg',
                    fit: BoxFit.cover,
                  ),
                  height: 300.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$currentMonth\'s Event',
                    style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.w300,
                      color: defaultTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Event Description',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: defaultTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //   decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(5.0),
                      //   color: accentColor,
                      // ),
                      //   height: 50.0,
                      //   width: 180.0,
                      //   child: Center(
                          // child: Text(
                          //   'Register Now',
                          //   style: TextStyle(
                          //     fontSize: 23.0,
                          //     fontWeight: FontWeight.w300,
                          //     color: textColor,
                          //   ),
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, AppWebView.route);
                           setPageInfo('Register', 'https://www.eventbrite.com/');
                           },
                           child: Container(
                             decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(10.0)),
                             child: Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w300,
                              color: defaultTextColor,
                            ),),
                           ),
                        //    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        // color: accentColor,
                        // padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                        // child: Text(
                        //     'Register Now',
                        //     style: TextStyle(
                        //       fontSize: 23.0,
                        //       fontWeight: FontWeight.w300,
                        //       color: textColor,
                        //     ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
