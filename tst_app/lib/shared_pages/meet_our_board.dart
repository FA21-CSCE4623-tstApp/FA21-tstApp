import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles.dart';
import '../home/home_screen.dart';

const Color textColor = Colors.black87;

class MeetOurBoard extends StatelessWidget {
  static const route = 'meet_our_board_screen';

  @override
  Widget build(BuildContext context) {
    const names = [
      'Juanita Harris',
      'Candice Williams',
      'LaQuita Thomas',
      'Michael Rhodes'
    ];
    const picture = [
      'Juanita_Harris.jpg',
      'Candace_Williams.jpg',
      'LaQuita_Thomas.jpg',
      'Michael_Rhodes.jpg'
    ];
    // final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appBackground,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: appBackground,
              elevation: 0.0,
              pinned: true,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Our Board',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      backgroundColor: textColor,
                    ),
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Pictures(
                          imageName: picture[index],
                        ),
                        SizedBox(width: 25.0),
                        Description(
                          title: names[index],
                        ),
                      ],
                    ),
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
  // FIX - create grid view, alternating pic and bio order
}

class Pictures extends StatelessWidget {
  Pictures({this.imageName = ""});
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 30.0, bottom: 30.0),
      child: Container(
        width: 105.0,
        height: 133.0,
        // color: Colors.blueGrey,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Image.asset(
            'assets/images/board/$imageName',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  Description({this.title = "", this.description = ""});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 22.0,
              color: textColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            width: 150.0,
            child: Text(
              'title description',
              style: TextStyle(
                color: textColor,
              ),
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Container(
            width: 150.0,
            child: Text(
              'Description of person',
              style: TextStyle(
                color: textColor,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
