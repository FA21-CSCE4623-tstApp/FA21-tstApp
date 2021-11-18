import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin_widgets.dart';

import '../../data/teacher_bulletin_data.dart';
import 'helper_functions.dart';
import '../../styles.dart';
import '../../shared_components/widgets.dart';

// TODO: start here. create a popup dialog

class DialogScreen extends StatefulWidget {
  static String route = 'dialog_screen';
  // bool show;
  DialogScreen({Key? key}) : super(key: key);

  @override
  _DialogScreenState createState() => _DialogScreenState();
}

// buttons on screen
bool isLike = false;
bool isDislike = false;
bool isShare = false;
bool isFlag = false;

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return Scaffold(
        body: Stack(children: [
          Container(color: appBackground),
          Column(children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: info.postBackgroundColor,
                  ),
                  child: Image.asset(
                    info.postImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 1.0),
                Container(
                  color: info.postBackgroundColor,
                  child: Image.asset(info.postImagePath, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 10.0,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isLike == false ? isLike = true : isLike = false;
                            });
                          },
                          child: likePostWidget(selected: isLike)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isDislike == false
                                  ? isDislike = true
                                  : isDislike = false;
                            });
                          },
                          child: dislikePostWidget(selected: isDislike)),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isShare == false
                                  ? isShare = true
                                  : isShare = false;
                            });
                          },
                          child: sharePostWidget(selected: isShare)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isFlag == false ? isFlag = true : isFlag = false;
                            });
                          },
                          child: reportPostWidget(selected: isFlag)),
                    ],
                  ),
                ),
                Positioned(
                    top: 5.0,
                    left: 10.0,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SafeArea(child: backNavigationWidget()))),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      info.postTitle,
                      style: const TextStyle(
                          color: defaultTextColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 30.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: info.postTags.length,
                            itemBuilder: (context, tagIndex) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Chip(
                                  backgroundColor: lightPurple,
                                  label: Text(
                                    info.postTags[tagIndex],
                                    style: defaultChipTextStyle,
                                  ),
                                ),
                              );
                            })),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            color: mediumBrown,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Icon(Icons.person, color: appBackground),
                        ),
                        SizedBox(width: 5.0),
                        Text(info.postAuthor),
                        Expanded(child: SizedBox(width: 5.0)),
                        Text(info.postDate),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 60.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(info.postBody,
                          style: const TextStyle(
                              fontSize: 16.0, color: defaultTextColor)),
                    ),
                  ),
                ],
              ),
            )
          ])
        ]),
      );
    });
  }
}
