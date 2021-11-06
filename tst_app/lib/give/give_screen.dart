// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'donation_history.dart';
import 'monthly_event.dart';
import '../home/page_components.dart';
import '../home/quotes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared_pages/donation_page.dart';
import '../styles.dart';

// final Color backgroundColor = Color(0xFFFFFBEF);
// final Color textColor = Colors.black54;
// final Color accentColor = Colors.deepOrange[300];
// final Color placeholderColor = Colors.yellow[100];
// final Color pageColor = Colors.green[200];

class GiveScreen extends StatelessWidget {
  static String route = 'give_screen';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBackground,
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            appbarColor: lightBrown,
            appbarTitle: 'Give',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 230.0,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Quotes.route);
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 230.0,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/ThankATeacherCelebration.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 230.0,
                          width: double.infinity,
                          color: Colors.black54,
                        ),
                        Positioned(
                          bottom: 40.0,
                          left: 8.0,
                          child: Text(
                            'Donate',
                            style: TextStyle(
                              fontSize: 60.0,
                              color: lightTextColor,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        SizedBox(width: 130.0),
                        Positioned(
                          left: 8.0,
                          bottom: 8.0,
                          child: Container(
                            width: screenWidth,
                            child: Text(
                              'Your donations allow us to support educators in your community',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: lightTextColor,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60.0, bottom: 20.0, right: 20.0, left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DonationPage.route);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: lightBrown,
                      ),
                      height: 65.0,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 30.0),
                          Icon(
                            FontAwesomeIcons.donate,
                            color: defaultTextColor,
                            size: 20.0,
                          ),
                          SizedBox(width: 30.0),
                          Text(
                            'Donate Now',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300,
                              color: defaultTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DonationHistory.route);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: lightBrown,
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 30.0),
                          Icon(
                            FontAwesomeIcons.receipt,
                            color: defaultTextColor,
                            size: 20.0,
                          ),
                          SizedBox(width: 30.0),
                          Text(
                            'Donation History',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300,
                              color: defaultTextColor,
                            ),
                          ),
                        ],
                      ),
                      // width: screenWidth - 100,
                      height: 65.0,
                    ),
                  ),
                ),
                Testimonial(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 80.0,
                        left: 8.0,
                      ),
                      child: Text(
                        'Event of the Month',
                        style: TextStyle(color: defaultTextColor, fontSize: 23.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
                      child: Container(
                        color: Colors.black87,
                        height: 270.0,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MonthlyEvent.route);
                          },
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 270.0,
                                child: Image.asset(
                                  'assets/images/TeachersLounge.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 270.0,
                                width: double.infinity,
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 2, sigmaY: 3),
                                  child: Container(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12.0,
                                top: 8.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'July 30',
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 85.0,
                                    ),
                                    Text(
                                      'Let\'s Chat',
                                      style: TextStyle(
                                        fontSize: 50.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Container(
                                      width: screenWidth,
                                      child: Text(
                                        'We have partnered with local licensed counselor Makesha Parrish',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Receipts extends StatelessWidget {
  const Receipts({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Quotes.route);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(),
                  color: Colors.yellow[50],
                ),
                width: 200.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        color: Colors.deepOrange[300],
                        width: 200.0,
                        height: 74.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  // right: 2.0,
                                  top: 8.0),
                              child: Text(
                                "March 7,",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35.0,
                            ),
                            Text(
                              "more",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12.0,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "2020",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          color: Colors.black,
                          height: 1.0,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                          child: Text(
                            "You donated",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 80.0),
                          child: Text(
                            "Your donation supports Thank a Teacher Celebration",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 75.0,
                      left: 8.0,
                      child: Text(
                        "47.00",
                        style: TextStyle(
                          fontSize: 55.0,
                          fontFamily: "Bad_Script",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Testimonial extends StatelessWidget {
  const Testimonial({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Text(
            'Testimonial',
            style: TextStyle(
              fontSize: 38.0,
              color: defaultTextColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {},
            child: Text(
              '"I became a teacher because I didn\'t like school growing up. I knew it could be fun! I knew it could be hands on and I knew I could involve art and science."',
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
              '-Karen Cherry-McDowell',
              style: TextStyle(
                  fontSize: 16.0,
                  color: defaultTextColor,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
  // TODO - finish give pg
  // TODO - add donate now
  // TODO - add
}


