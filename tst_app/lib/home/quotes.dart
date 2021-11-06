import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

const Color backgroundColor = Color(0xFFFFFBEF);
const Color textColor = Colors.black87;

class Quotes extends StatelessWidget {
  static const route = 'quotes_page';

  @override
  Widget build(BuildContext context) {
    var quote = new Quote(); //TODO: add quotes to main home screen later
    print(quote.quotesList());

    final double height = MediaQuery.of(context).size.height - 120.0;

    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: height),
          child: Container(
            width: 30.0,
            height: 30.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: textColor,
              child: Icon(
                FontAwesomeIcons.times,
                size: 15.0,
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Date ${index + 1}',
                      style: TextStyle(color: textColor, fontSize: 23.0),
                    ),
                    Text(
                      'Quote ${index + 1}',
                      style: TextStyle(color: textColor, fontSize: 15.0),
                    ),
                    Text(
                      'Person ${index + 1}',
                      style: TextStyle(color: textColor, fontSize: 15.0),
                    ),
                  ],
                ),
              );
            }));
  }
}


class Quote {

String author = "";
String quote = "";
Map quotes = {};

// grab names from text file
Future<String> quotesList(){ 
  var newFile = File('lib/home/quotes.txt');
  return newFile.readAsString();
}

}