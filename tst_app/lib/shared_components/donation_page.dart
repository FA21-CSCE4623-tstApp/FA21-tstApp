import 'package:flutter/material.dart';
import '../styles.dart';


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
            child: Container(),
            // RaisedButton(
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
            //   elevation: 10.0,
            //   color: accentColor,
            //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
            //   onPressed: () {
            //     setPageInfo('Cash App', 'https://cash.app/%24TST2019');
            //     Navigator.pushNamed(context, AppWebView.route);
            //   },
            //   child: Text(
            //     'Give via CashApp',
            //     style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: backgroundColor),
            //   ),
            // ),
          ),
          // RaisedButton(
          //   color: accentColor,
          //   elevation: 8.0,
          //    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
          //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
          //   onPressed: () {
          //     setPageInfo('PayPal', 'https://www.paypal.me/TST2020');
          //     Navigator.pushNamed(context, AppWebView.route);
          //   },
          //   child: Text(
          //     'Give via PayPal',
          //     style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300, color: backgroundColor),
          //   ),
          // ),
        ],
      ),
    );
  }
}


