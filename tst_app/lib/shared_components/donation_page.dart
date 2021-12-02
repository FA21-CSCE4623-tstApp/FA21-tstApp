import 'package:flutter/material.dart';
import 'package:tst_app/home/calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles.dart';
import 'in_app_web.dart';


class DonationPage extends StatelessWidget {
  static const route = 'donation_screen';

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // var dateInfo = DateTime.now();
    // var currentMonth = DateFormat.MMMM().format(dateInfo);
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Donate Now'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/ThankATeacherCelebration.jpg',
                  fit: BoxFit.cover,
                ),
                height: 230.0,
                width: double.infinity,
              ),
              Container(
                height: 230.0,
                width: double.infinity,
                color: Colors.black26,
              ),
            ],
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
              child: Text(
                'Your donations are essential to what we do here at TST. You allow us to directly support local educators. Giving is easy and secure – just a click of a button.',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
             child: RaisedButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
               elevation: 10.0,
               color: Colors.green,
               padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
               onPressed: () {
                 const url = 'https://cash.app/%24TST2019';
                 launch(url);
               },
               child: Text(
                'Give via CashApp',
                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: backgroundColor),
               ),
             ),
          ),
           RaisedButton(
             color: Colors.blueAccent,
             elevation: 8.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
             padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
             onPressed: () {
               const url = 'https://www.paypal.me/TST2020';
               launch(url);
             },
             child: Text(
               'Give via PayPal',
               style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300, color: backgroundColor),
             ),
           ),
        ],
      ),
    );
  }
}


