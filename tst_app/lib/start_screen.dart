import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tst_app/resources/resources_screen.dart';
import 'package:tst_app/styles.dart';

import 'data/teacher_bulletin_data.dart';
import 'give/give_screen.dart';
import 'home/home_screen.dart';
import 'on_first_start/on_first_start.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  static const route = 'start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

int _selectedIndex = 0;

class _StartScreenState extends State<StartScreen> {
  bool isFirstRun = false;
  checkIsFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstRun = prefs.getBool('isFirstRun') ?? true;
    });

    if (!isFirstRun) prefs.setBool('isFirstRun', true);
    print("first run? $isFirstRun");
  }

  final selectedPage = [
    HomeScreen(),
    GiveScreen(),
    ResourcesScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIsFirstRun();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return isFirstRun
          ? Scaffold(body: OnFirstRun())
          : Scaffold(
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
            );
    });
  }
}
