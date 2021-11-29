import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/data/teacher_bulletin_data.dart';
import '../resources/TeacherBulletin/post_dialog.dart';
import '../resources/TeacherBulletin/teacher_bulletin.dart';
import '../styles.dart';
import '../test.dart';
import 'data/events_data.dart';
import 'home/home_screen.dart';
import 'shared_components/learn_more.dart';
import 'shared_components/login_page.dart';
import 'shared_components/meet_our_board.dart';
import 'home/quotes.dart';
import 'resources/resources_screen.dart';
import 'give/give_screen.dart';
import 'home/gallery.dart';
import 'home/calendar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'give/monthly_event.dart';
import 'shared_components/donation_page.dart';
import 'give/donation_history.dart';
import 'shared_components/in_app_web.dart';
import 'resources/articles.dart';
import 'resources/all_events.dart';
import 'resources/teacher_hacks.dart';
import 'package:firebase_core/firebase_core.dart';
import '/shared_components/widgets.dart';

int _selectedIndex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TSTApp());
}

class TSTApp extends StatefulWidget {
  @override
  _TSTAppState createState() => _TSTAppState();
}

class _TSTAppState extends State<TSTApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      //TODO: create an error screen
      return Container();
    }

    if (!_initialized) {
      //TODO: create a loading screen
      return secondaryLoadingIndicator();
    }

    final selectedPage = [
      HomeScreen(),
      GiveScreen(),
      ResourcesScreen(),
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TBData()),
        ChangeNotifierProvider(create: (_) => AEData()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: lightPurple)),
        initialRoute: '/',
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
          AllEvents.route: (context) => AllEvents(),
          TeacherBulletin.route: (context) => TeacherBulletin(),
          DialogScreen.route: (context) => DialogScreen(),
          Test.route: (context) => Test(),
        },
        home: Scaffold(
          body: selectedPage[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 15.0,
            backgroundColor: appBackground,
            currentIndex: _selectedIndex,
            items: const <BottomNavigationBarItem>[
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
            unselectedItemColor: Colors.black26,
            selectedItemColor: accentColor,
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
