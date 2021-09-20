import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:tst_app/give/give_screen.dart';
// import 'package:tst_app/resources/resources_screen.dart';
import 'package:tst_app/shared_pages/login_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'home_screen.dart';


// const Color placeholderColor = Colors.amber[100];
// final Color textColor = Colors.black54;
// const Color accentColor = Colors.deepOrange[300];
// final Color textColor = Colors.black87;
// final Color backgroundColor = Color(0xFFFFFBEF);


//top app bar
class CustomAppBar extends StatelessWidget {
  CustomAppBar({@required this.appbarColor, @required this.appbarTitle});
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
//FIX upload video to teacher.spprt.teachers@gmail.com and use id link
class AboutUsVideo extends StatelessWidget {

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'y4SRd7paKOI',
    flags: YoutubePlayerFlags(
      mute: false,
      loop: true,
      autoPlay: false,
    ),
  );

  void listener() {
  }


  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressColors: ProgressBarColors(handleColor: Colors.white, playedColor: Colors.black12),
      onReady: () {
    _controller.addListener(listener);
      },
    );
  }
}

//calendar
class MonthlyCalendar extends StatefulWidget {
  @override
  _MonthlyCalendarState createState() => _MonthlyCalendarState();
}

class _MonthlyCalendarState extends State<MonthlyCalendar> {
  CalendarController _calendarController;
  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      calendarStyle: CalendarStyle(
        weekendStyle: TextStyle(
          color: Colors.black,
        ),
        weekdayStyle: TextStyle(
          color: Colors.black,
        ),
        selectedColor: Colors.deepOrange[300],
        markersColor: Colors.deepOrange[50],
        todayColor: Colors.deepOrangeAccent,
      ),
      availableCalendarFormats: {CalendarFormat.month: 'Month'},
      weekendDays: [],
    );
  }
}
