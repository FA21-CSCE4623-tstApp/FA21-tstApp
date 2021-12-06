import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tst_app/home/home_screen.dart';
import 'package:tst_app/home/quotes.dart';
import 'package:tst_app/main.dart';
import 'package:tst_app/styles.dart';
import 'package:provider/provider.dart';
import '../data/teacher_bulletin_data.dart';
import '../start_screen.dart';

class OnFirstRun extends StatefulWidget {
  const OnFirstRun({Key? key}) : super(key: key);
  static const route = 'top_user_benefits';

  @override
  _OnFirstRunState createState() => _OnFirstRunState();
}

class _OnFirstRunState extends State<OnFirstRun> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return MaterialApp(
      debugShowCheckedModeBanner: false, //removes debug banner at top right
      home: Material(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            PageOne(
              controller: controller,
            ),
            PageTwo(controller: controller),
            PageThree(controller: controller),
          ],
        ),
      ),
    );
  }
}

// ============== Page 1 ==============
class PageOne extends StatefulWidget {
  PageController controller;
  PageOne({Key? key, required this.controller}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Image.asset('assets/images/teacher_bulletin/apple.png'),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  "See what we do and find encouragement",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: defaultTextColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "We love to share all of the things we've been up to."
                  " If you're new to Teachers Support Teachers, "
                  "want to learn more about us, or see how we work with educators,"
                  " our Home screen is a a great place to start.",
                  style: TextStyle(color: defaultTextColor, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: mediumBrown,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => TSTApp()));
                      },
                      child: const Text(
                        "skip",
                        style: TextStyle(
                            color: mediumBrown, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(width: 1.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.controller.nextPage(
                            duration: const Duration(milliseconds: 5),
                            curve: Curves.ease);
                      },
                      child: Row(
                        children: const [
                          Text(
                            "next",
                            style: TextStyle(
                                color: mediumBrown,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.arrow_forward, color: mediumBrown),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ============== Page 2 ==============
class PageTwo extends StatefulWidget {
  PageController controller;
  PageTwo({Key? key, required this.controller}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Image.asset('assets/images/teacher_bulletin/apple.png'),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  "Get involved with us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: defaultTextColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "We are supported through generous contributions "
                  "from people like you! Your donations allow us to create programming"
                  " for educators in your community. All donations are secure and you can track "
                  "your contributions here in the app."
                  "  We will continue to update you on all of the amazing ways it allows us to"
                  "encourage teachers.",
                  style: TextStyle(color: defaultTextColor, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: mediumBrown,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.controller.previousPage(
                            duration: const Duration(milliseconds: 5),
                            curve: Curves.ease);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_back, color: mediumBrown),
                          SizedBox(width: 8.0),
                          Text(
                            "back",
                            style: TextStyle(
                                color: mediumBrown,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox(width: 1.0)),
                    GestureDetector(
                      onTap: () {
                        widget.controller.nextPage(
                            duration: const Duration(milliseconds: 5),
                            curve: Curves.ease);
                      },
                      child: Row(
                        children: const [
                          Text(
                            "next",
                            style: TextStyle(
                                color: mediumBrown,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8.0),
                          Icon(Icons.arrow_forward, color: mediumBrown),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ============== Page 3 ==============
class PageThree extends StatefulWidget {
  PageController controller;
  PageThree({Key? key, required this.controller}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: Image.asset('assets/images/teacher_bulletin/apple.png'),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  "We offer resources for educators",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: defaultTextColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "All of the work we do centers on supporting educators."
                  " Whether you're a teacher, a paraprofessional, or an administrator, "
                  " we're here to support you so that you can continue inspiring others."
                  " You can sign up for future events, view past events, and access "
                  "other materials on our Resources screen.",
                  style: TextStyle(color: defaultTextColor, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                          color: mediumBrown,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // TODO: set bool to true so that app can start properly
                          print("get started");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => TSTApp()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: lightBrown,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "get started",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: defaultTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    // });
  }
}
