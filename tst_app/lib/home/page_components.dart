import 'package:flutter/material.dart';
import '../shared_pages/login_page.dart';
import 'package:table_calendar/table_calendar.dart';
import '../styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//top app bar
class CustomAppBar extends StatelessWidget {
  CustomAppBar({this.appbarColor = appBackground, this.appbarTitle = ""});
  final Color appbarColor;
  final String appbarTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        title: Text(
          appbarTitle,
          style: TextStyle(
            color: Color(0xFFFFFBEF),
            fontSize: 26.0,
          ),
        ),
        floating: true,
        backgroundColor: appbarColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LoginRegister.route);
            },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Center(
                  child: Text(
                    'log in',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFBEF),
                    ),
                  ),
                ),
              ),

          ),
        ]);
  }
}


//about us video
//TODO: FIX upload video to teacher.spprt.teachers@gmail.com and use id link
class AboutUsVideo extends StatelessWidget {

  // final YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'y4SRd7paKOI',
  //   flags: YoutubePlayerFlags(
  //     mute: false,
  //     loop: true,
  //     autoPlay: false,
  //   ),
  // );

  void listener() {
  }


  @override
  Widget build(BuildContext context) {
    return Container();
    // return YoutubePlayer(
    //   controller: _controller,
    //   showVideoProgressIndicator: true,
    //   progressColors: ProgressBarColors(handleColor: Colors.white, playedColor: Colors.black12),
    //   onReady: () {
    // _controller.addListener(listener);
    //   },
    // );
  }
}

//calendar
class MonthlyCalendar extends StatefulWidget {
  @override
  _MonthlyCalendarState createState() => _MonthlyCalendarState();
}

class _MonthlyCalendarState extends State<MonthlyCalendar> {


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
        weekendTextStyle: TextStyle(
          color: Colors.black,
        ),
        defaultTextStyle: TextStyle(
          color: defaultTextColor,
        ),
      ),
      availableCalendarFormats: {CalendarFormat.month: 'Month'},
      weekendDays: [],
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2020, 1, 1),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        color: mediumPurple,
        height: 230.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  color: lightTextColor,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 30.0,
                      color: lightTextColor,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'teacher.spprt.teachers@gmail.com',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            color: lightTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Center(
                child: Container(
                  color: lightTextColor,
                  width: 340.0,
                  height: 0.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.facebook,
                      color: lightTextColor,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '@TeachersSupportTeachers2019',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            color: lightTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}