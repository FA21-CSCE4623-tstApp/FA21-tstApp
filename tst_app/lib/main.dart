import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/internet_stuff/gallery_photos.dart';
import 'package:tst_app/resources/teacher_bulletin.dart';
import 'package:tst_app/test.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:tst_app/home/page_components.dart';
import 'home/home_screen.dart';
import 'shared_pages/learn_more.dart';
import 'shared_pages/login_page.dart';
import 'shared_pages/meet_our_board.dart';
import 'home/quotes.dart';
import 'resources/resources_screen.dart';
import 'give/give_screen.dart';
import 'home/gallery.dart';
import 'home/calendar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'give/monthly_event.dart';
import 'shared_pages/donation_page.dart';
import 'give/donation_history.dart';
import 'shared_pages/in_app_web.dart';
import 'resources/articles.dart';
import 'resources/past_events.dart';
import 'resources/teacher_hacks.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'home/page_components.dart';

int _selectedIndex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TSTApp());
}

class TSTApp extends StatefulWidget {
  @override
  _TSTAppState createState() => _TSTAppState();
}

class _TSTAppState extends State<TSTApp> {
  @override
  Widget build(BuildContext context) {
    final selectedPage = [
      HomeScreen(),
      GiveScreen(),
      ResourcesScreen(),
    ];
    return ChangeNotifierProvider(
      create: (_) => GalleryPhotos(),
      child: MaterialApp(
        initialRoute: ResourcesScreen.route,
        routes: {
          HomeScreen.route: (context) => HomeScreen(),
          LoginRegister.route: (context) => LoginRegister(),
          LearnMore.route: (context) => LearnMore(),
          MeetOurBoard.route: (context) => MeetOurBoard(),
          Quotes.route: (context) => Quotes(),
          ResourcesScreen.route: (context) => ResourcesScreen(),
          GiveScreen.route: (context) => GiveScreen(),
          Gallery.route: (context) => Gallery(),
          Calendar.route: (context) => Calendar(),
          MonthlyEvent.route: (context) => MonthlyEvent(),
          DonationPage.route: (context) => DonationPage(),
          DonationHistory.route: (context) => DonationHistory(),
          AppWebView.route: (context) => AppWebView(),
          Articles.route: (context) => Articles(),
          TeacherHacks.route: (context) => TeacherHacks(),
          PastEvents.route: (context) => PastEvents(),
          TeacherBulletin.route: (context) => TeacherBulletin(),

          Test.route: (context) => Test(),
        },
        home: Scaffold(
          body: selectedPage[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 15.0,
            backgroundColor: Color(0xFFFFFBEF),
            currentIndex: _selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.homeVariantOutline),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.heartOutline),
                label: 'Give',
              ),
              BottomNavigationBarItem(
                icon: RotatedBox(
                    quarterTurns: 3, child: Icon(MdiIcons.leadPencil)),
                label: 'Resources',
              ),
            ],
            selectedItemColor: Colors.deepOrange[300],
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
