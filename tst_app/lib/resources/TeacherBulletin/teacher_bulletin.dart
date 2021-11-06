import 'package:flutter/material.dart';
import 'package:tst_app/data/teacher_bulletin_data.dart';
import '../../styles.dart';
import 'package:provider/provider.dart';

class TeacherBulletin extends StatelessWidget {
  static String route = 'teacher_bulletin_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return FutureBuilder(
          future: info.postData,
          builder: (context, db) {
            // Teacher Bulletin DATA ==============
            var data = db.data;
            List<Map> postData = []; // TODO: START HERE: convert to a list
            // int postLength = postData;
            // ====================================
            print("postData ${data.runtimeType}");
            if (db.hasData) {
              return Scaffold(
                backgroundColor: appBackground,
                appBar: AppBar(
                  elevation: 1.0,
                  iconTheme: const IconThemeData(color: Colors.black38),
                  backgroundColor: lightBrown,
                  title: const Text(
                    'Teacher\'s Bulletin',
                    style: TextStyle(fontSize: 20.0, color: defaultTextColor),
                  ),
                ),
                body: Padding(
                  padding: defaultScreenPadding,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            // Padding(
                            //   padding: defaultSectionPadding,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 40.0),
                              child: Text(
                                "Change What You See",
                                style: defaultWidgetTextStyle,
                              ),
                            ),

                            // 1st column ... "I want to focus on..."
                            const Text("I want blogs that focus on..."),
                            const SizedBox(height: 10.0),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: const Chip(
                                backgroundColor: lightPurple,
                                label: Text(
                                  "Educators",
                                  style: defaultChipTextStyle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            // 2nd row "I want to see blogs that..."
                            const Text("I want to see blogs that..."),
                            const SizedBox(width: 1.0),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Chip(
                                backgroundColor: lightPurple,
                                label: Text(
                                  "K4",
                                  style: defaultChipTextStyle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            // 3rd row "I would like to see posts that... "
                            const Text("I want blogs that focus on..."),
                            const SizedBox(width: 10.0),
                            SizedBox(
                                height: 50.0,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      List tags = ["Inspiration", "K5"];
                                      return Chip(
                                        backgroundColor: lightPurple,
                                        label: Text(
                                          tags[index],
                                          style: defaultChipTextStyle,
                                        ),
                                      );
                                    })),
                            // Container(
                            //     width: double.infinity,
                            //     child: ListView(
                            //       children: const [],
                            //     )
                            // child: ListView(
                            //   children: [
                            //     Chip(
                            //       backgroundColor: lightPurple,
                            //       label: Text(
                            //         "Inpiration",
                            //         style: defaultChipTextStyle,
                            //       ),
                            //     ),
                            //     SizedBox(width: 10.0),
                            //     Chip(
                            //       //TODO: make
                            //       backgroundColor: lightPurple,
                            //       label: Text(
                            //         "Kindergarten",
                            //         style: defaultChipTextStyle,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // ),
                            // ListView(
                            //     scrollDirection: Axis.horizontal,
                            //     children: const [
                            //       Chip(
                            //         backgroundColor: lightPurple,
                            //         label: Text(
                            //           "Inpiration",
                            //           style: defaultChipTextStyle,
                            //         ),
                            //       ),
                            //       SizedBox(width: 10.0),
                            //       Chip(
                            //         //TODO: make
                            //         backgroundColor: lightPurple,
                            //         label: Text(
                            //           "Kindergarten",
                            //           style: defaultChipTextStyle,
                            //         ),
                            //       ),
                            //     ]),
                            //
                            // Row(
                            //   children: const
                            //     Chip(
                            //       backgroundColor: lightPurple,
                            //       label: Text("Inpiration", style: defaultChipTextStyle,),
                            //     ),
                            //     SizedBox(width: 10.0),
                            //     Chip(
                            //       //TODO: make
                            //       backgroundColor: lightPurple,
                            //       label: Text("Kindergarten", style: defaultChipTextStyle,),
                            //     ),
                            //   ],
                            // )

                            Padding(
                              padding: defaultSectionPadding,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                        color: defaultTextColor, height: 0.5),
                                  ),
                                  Row(
                                    children: [
                                      const Text("Add a Post",
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              color: defaultTextColor)),
                                      const Expanded(
                                          child: SizedBox(width: 10.0)),
                                      Container(
                                        decoration: defaultRoundedCorners,
                                        child: const Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "add",
                                            style: TextStyle(
                                              color: lightTextColor,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                        color: defaultTextColor, height: 0.5),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: defaultSectionPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Text(
                                      "Relevant",
                                      style: defaultWidgetTextStyle,
                                    ),
                                  ),
                                  Column(
                                      children: List.generate(5,
                                          (index) => BlogPost(index: index))),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              //TODO: create loading screen
              return Container();
            }
          });
    });
  }
}

class BlogPost extends StatelessWidget {
  final int index;

  BlogPost({this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: (index % 2) == 0
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 100.0, decoration: defaultRoundedCorners),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(children: [
                      const Text("An idea to decorate your classroom",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: defaultRoundedCorners,
                          ),
                          const SizedBox(width: 10.0),
                          const Expanded(
                            child: Text(
                              "submitted by: ",
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Expanded(
                            child: Text("Kelly H. ",
                                style: TextStyle(fontSize: 10.0)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Chip(
                            backgroundColor: lightPurple,
                            label: Text(
                              "K4",
                              style: defaultChipTextStyle,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Chip(
                            backgroundColor: lightPurple,
                            label: Text(
                              "Inpiration",
                              style: defaultChipTextStyle,
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      const Text("An idea to decorate your classroom",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: defaultRoundedCorners,
                          ),
                          const SizedBox(width: 10.0),
                          const Expanded(
                            child: Text(
                              "submitted by: ",
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Expanded(
                            child: Text("Kelly H. ",
                                style: TextStyle(fontSize: 10.0)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            child: const Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "K4",
                                style: TextStyle(color: lightTextColor),
                              ),
                            ),
                            decoration: defaultRoundedCorners,
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            child: const Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Inspiration",
                                style: TextStyle(color: lightTextColor),
                              ),
                            ),
                            decoration: defaultRoundedCorners,
                          ),
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Container(
                        height: 100.0, decoration: defaultRoundedCorners),
                  ),
                ],
              ));
  }
}
