import 'package:flutter/material.dart';
import 'package:tst_app/styles.dart';

class TeacherBulletin extends StatelessWidget {
  static String route = 'teacher_bulletin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: lightBrown,
        title: Text(
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
                  Padding(
                    padding: defaultSectionPadding,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "Change What You See",
                              style: defaultWidgetTextStyle,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                // 1st row ... "I want to focus on..."
                                Row(
                                  children: [
                                    Text("I want blogs that focus on..."),
                                    Expanded(child: SizedBox(width: 10.0)),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Educators",
                                          style:
                                              TextStyle(color: lightTextColor),
                                        ),
                                      ),
                                      decoration: defaultRoundedCorners,
                                    ),
                                  ],
                                ),
                                // 2nd row "I want to see blogs that..."
                                SizedBox(height: 30.0),
                                Row(
                                  children: [
                                    Text("I want blogs that focus on..."),
                                    Expanded(child: SizedBox(width: 10.0)),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "K4",
                                          style:
                                              TextStyle(color: lightTextColor),
                                        ),
                                      ),
                                      decoration: defaultRoundedCorners,
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Kindergarten",
                                          style:
                                              TextStyle(color: lightTextColor),
                                        ),
                                      ),
                                      decoration: defaultRoundedCorners,
                                    ),
                                  ],
                                ),
                                // 3rd row "I would like to see posts that... "
                                SizedBox(height: 30.0),
                                Row(
                                  children: [
                                    Text("I want blogs that focus on..."),
                                    Expanded(child: SizedBox(width: 10.0)),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "Inspiration",
                                          style:
                                              TextStyle(color: lightTextColor),
                                        ),
                                      ),
                                      decoration: defaultRoundedCorners,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: defaultSectionPadding,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child:
                              Container(color: defaultTextColor, height: 0.5),
                        ),
                        Row(
                          children: [
                            Text("Add a Post",
                                style: TextStyle(
                                    fontSize: 25.0, color: defaultTextColor)),
                            Expanded(child: SizedBox(width: 10.0)),
                            Container(
                              decoration: defaultRoundedCorners,
                              child: Padding(
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
                          child:
                              Container(color: defaultTextColor, height: 0.5),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: defaultSectionPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            "Relevant",
                            style: defaultWidgetTextStyle,
                          ),
                        ),
                        Column(
                            children: List.generate(5, (index) => BlogPost(index: index))),
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
                      Text("An idea to decorate your classroom",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600)),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: defaultRoundedCorners,
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Text(
                              "submitted by: ",
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text("Kelly H. ",
                                style: TextStyle(fontSize: 10.0)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "K4",
                                style: TextStyle(color: lightTextColor),
                              ),
                            ),
                            decoration: defaultRoundedCorners,
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            child: Padding(
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
                ],
              )
            : Row(
          children: [
            Expanded(
              child: Column(children: [
                Text("An idea to decorate your classroom",
                    style: TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w600)),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: defaultRoundedCorners,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "submitted by: ",
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text("Kelly H. ",
                          style: TextStyle(fontSize: 10.0)),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "K4",
                          style: TextStyle(color: lightTextColor),
                        ),
                      ),
                      decoration: defaultRoundedCorners,
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      child: Padding(
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
            SizedBox(width: 20.0),
            Expanded(
              child: Container(
                  height: 100.0, decoration: defaultRoundedCorners),
            ),

          ],
        ));
  }
}
