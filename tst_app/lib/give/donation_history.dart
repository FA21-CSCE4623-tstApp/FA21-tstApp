import 'package:flutter/material.dart';
import '../styles.dart';
// import '../home/home_screen.dart';


class DonationHistory extends StatelessWidget {
  static const route = 'DonationHistory_screen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
          backgroundColor: lightBrown,
          elevation: 1.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Donation History',
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 40.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 40.0, bottom: 12.0),
                child: Container(
                  // color: Colors.green,
                  child: Column(
                    children: [
                      Text(
                        'You\'ve donated \$410.00 so far',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 45.0,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                       Padding(
                            padding: const EdgeInsets.only(top: 80.0,),
                            child: Container(
                              height: 1.0,
                              width: screenWidth,
                              color: accentColor,
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ),
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
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0, top: 8.0, bottom: 8.0),
                                        child: Text(
                                          'Donation',
                                          style: TextStyle(
                                              color: Colors.black87,
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
                                  SizedBox(width: 15.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green[300],
                                    ),
                                    width: 165.0,
                                    height: 50.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: appBackground,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          '\$23.00',
                                          style: TextStyle(
                                              color: appBackground,
                                              fontSize: 35.0,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios,
                                  size: 25.0, color: Colors.black26)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Container(
                              height: 1.0,
                              width: screenWidth,
                              color: accentColor,
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
