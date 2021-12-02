import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/resources/TeacherBulletin/tag_selection.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin_widgets.dart';
import '../../data/teacher_bulletin_data.dart';
import 'helper_functions.dart';
import '../../styles.dart';
import '../../shared_components/widgets.dart';

// TODO: start here. create a popup dialog

class BlogScreen extends StatefulWidget {
  static String route = 'blog_screen';

  // bool show;
  BlogScreen({Key? key}) : super(key: key);
  final int index = 0;

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final bodyController = TextEditingController();
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    final TBData data = new TBData();
    var curDate = new DateTime.now();
    var formatDate = new DateFormat('yMd');
    String formattedDate = formatDate.format(curDate);

    // TO DO
    // Validate
    // Title, Body, Author
    // Color scheme
    // FIREBASE!!!!!
    // ORGANIZE FOR PUSH TO MAIN.

    // DONE
    // Make x like event x on blog dialog
    // Fix routing bug after adding tags

    return Consumer<TBData>(builder: (consumerContext, info, child) {
      var userTags = info.userTags;
      debugPrint("TAGCOUNT:" + userTags.length.toString());
      return !info.showScreen
          ? Container()
          : Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          GestureDetector(
            onTap: () {
              info.setShowScreen = false;
              Navigator.pushReplacementNamed(
                  context, TeacherBulletin.route);
              Navigator.of(context).pop;
            },
            child: Container(
              color: Colors.black54,
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
                              onTap: () {
                                info.setShowScreen = false;
                                bodyController.text = "";
                                titleController.text = "";
                                authorController.text = "";
                                info.clearTags();
                              },
                              child: Container(
                                child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.close,
                                        color: Colors.white70)),
                                decoration: BoxDecoration(
                                    color: mediumBrown,
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                        ),
                        TextField(
                            maxLines: 1,
                            maxLength: 30,
                            controller: titleController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Title",
                              //  focusedErrorBorder:
                              //title empty then set color to red.
                            ),
                            style: TextStyle(color: darkBrown, fontSize: 24)),
                        Row(
                          children: [
                            Builder(builder: (context) {
                              return GestureDetector(
                                onTap: () =>
                                    Scaffold.of(context).showBottomSheet(
                                          (context) => TagSelectionScreen(),
                                      shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                      ),
                                    ),
                                child: Icon(Icons.add_circle_outlined),
                              );
                            }),
                            Expanded(
                              child: Container(
                                  height: 30.0,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: userTags.length,
                                      //(info.postTags.length),
                                      itemBuilder: (context, tagIndex) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Chip(
                                            backgroundColor: lightPurple,
                                            label: Text(
                                              info.userTags[tagIndex],
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
                          children: [
                            Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                color: mediumBrown,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Icon(Icons.person,
                                  color: appBackground),
                            ),
                            Expanded(
                              child: TextFormField(
                                  controller: authorController,
                                  decoration: const InputDecoration(
                                    hintText: "Author",
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      fontSize: 16, color: darkBrown)),
                            )
                          ],
                        ),
                        Text(formattedDate,
                            style: TextStyle(
                                fontSize: 12, color: defaultTextColor)),
                        TextFormField(
                          maxLines: 10,
                          controller: bodyController,
                          // onSaved: (String? body){
                          //  // controller: myController.text(body),
                          //   controller: myController,
                          //   info.setBody(body!);
                          //   debugPrint("BODY: " + myController.text);
                          // },
                          decoration: InputDecoration(
                            // BODY
                            hintText:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                                "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                "Consectetur libero id faucibus nisl tincidunt. Suspendisse faucibus "
                                "interdum posuere lorem ipsum dolor sit amet. Diam sit amet nisl suscipit adipiscing bibendum. "
                                "Orci a scelerisque purus semper eget duis at tellus at. Ornare suspendisse sed nisi lacus. "
                                "Mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor.",
                            // add hint text instead of hard code.
                            border: InputBorder.none,
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
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text(
                                  "   Blog Posted!",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkBrown,
                                      fontWeight: FontWeight.w500),
                                ),
                                duration: const Duration(milliseconds: 1500),
                                backgroundColor: appBackground,
                                width: 130,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                              ));
                              info.setBody(bodyController.text);
                              info.setTitle(titleController.text);
                              info.setAuthor(authorController.text);
                              //info.createBlogPosts();
                              Timer(
                                  Duration(milliseconds: 1600),
                                      (){
                                    info.setShowScreen = false;
                                  }
                              );
                            },
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
