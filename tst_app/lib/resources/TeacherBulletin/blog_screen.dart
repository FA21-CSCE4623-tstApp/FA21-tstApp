import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/resources/TeacherBulletin/tag_selection.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin_widgets.dart';

import '../../data/teacher_bulletin_data.dart';
import 'helper_functions.dart';
import '../../styles.dart';
import '../../shared_components/widgets.dart';

// TODO: start here. create a popup dialog

class BlogScreen extends StatefulWidget {
  static String route = 'dialog_screen';

  // bool show;
  BlogScreen({Key? key}) : super(key: key);
  final int index = 0;

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext buildContext) {
    final TBData data = new TBData();
    var curDate = new DateTime.now();
    var formatDate = new DateFormat('yMd');
    String formattedDate = formatDate.format(curDate);

    return Consumer<TBData>(builder: (consumerContext, info, child) {
      return !info.showScreen
          ? Container()
          : Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(children: [
                GestureDetector(
                  onTap: () => info.setShowScreen = false,
                  child: Container(
                    color: Colors.black87,
                  ),
                ),
                SafeArea(
                    child: Center(
                      child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      //clipBehavior: Clip.hardEdge,
                      color: appBackground,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: ListView(shrinkWrap: true,
                      //   children: [
                      //     Text("Please Fix Yourself")
                      //   ],
                      // ),
                      child: ListView(
                        shrinkWrap: true,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => info.setShowScreen = false,
                              child: Icon(Icons.close, color: darkBrown),
                            ),
                          ),
                          TextFormField(
                              initialValue: "",
                              maxLines: 1,
                              maxLength: 30,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Title",
                              ),
                              style: TextStyle(color: darkBrown, fontSize: 24)),
                          Row(
                            children: [
                              Builder(
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => Scaffold.of(context).showBottomSheet((context) => TagSelectionScreen(),
                                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    ),
                                    ),
                                      child: Icon(Icons.add_circle_outlined),
                                  );
                                }
                              ),
                              Expanded(
                                child: Container(
                                    height: 30.0,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 6,
                                        //(info.postTags.length),
                                        itemBuilder: (context, tagIndex) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Chip(
                                              backgroundColor: lightPurple,
                                              label: Text(
                                                "WOOOOOOO",
                                                //info.postTags[widget.index][tagIndex],
                                                style: defaultChipTextStyle,
                                              ),
                                            ),
                                          );
                                        })),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  const [
                                Icon(
                                  Icons.account_box,
                                  size: 10,
                                ),
                                Text(
                                 " submitted by: ", style:
                                TextStyle(fontSize: 14, color: defaultTextColor),
                                ),
                              ],
                          ),
                          Text(formattedDate,
                              style: TextStyle(
                                  fontSize: 10, color: defaultTextColor)),
                          TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                                  "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                  "Consectetur libero id faucibus nisl tincidunt. Suspendisse faucibus "
                                  "interdum posuere lorem ipsum dolor sit amet. Diam sit amet nisl suscipit adipiscing bibendum. "
                                  "Orci a scelerisque purus semper eget duis at tellus at. Ornare suspendisse sed nisi lacus. "
                                  "Mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor.",
                              // add hint text instead of hard code.
                              border: InputBorder.none,
                            ),
                            controller: TextEditingController(
                              text: "",
                            ),
                            style: const TextStyle(
                              overflow: TextOverflow.clip,
                              fontSize: 14,
                            ),
                          ),
                          // creates blog post
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              // onTap: () => data.createData,
                              child: Icon(
                                Icons.post_add_sharp,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
                    ))
              ]),
            );
    });
  }
}

