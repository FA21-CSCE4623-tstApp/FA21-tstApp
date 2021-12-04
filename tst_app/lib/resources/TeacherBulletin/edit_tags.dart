import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/resources/TeacherBulletin/tag_selection.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin_widgets.dart';
import '../../data/teacher_bulletin_data.dart';
import 'package:tst_app/helper_functions.dart';
import '../../styles.dart';
import '../../shared_components/widgets.dart';

// TODO: start here. create a popup dialog

class EditTagsDialog extends StatefulWidget {
  static String route = 'blog_screen';

  // bool show;
  EditTagsDialog({Key? key}) : super(key: key);
  final int index = 0;

  @override
  _EditTagsDialogState createState() => _EditTagsDialogState();
}

List<String> tagSuggestions = <String>[
  'High School',
  'Middle School',
  'College',
  'Elementary',
  'Teacher Hacks',
  'Lunch Ideas',
  'Holiday Season',
  'Decoration Ideas'
      "K4",
];
List firstSelected = List.filled(tagSuggestions.length, false);
var length = tagSuggestions.length;
List selectedChips = [];

class _EditTagsDialogState extends State<EditTagsDialog> {
  @override
  Widget build(BuildContext buildContext) {
    List colors = [Color(0xffb39ddb), Color(0xff805acb), Color(0xff9c64a6)];

    return Consumer<TBData>(builder: (consumerContext, info, child) {
      return !info.showEditTagDialog
          ? Container()
          : Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(children: [
                GestureDetector(
                  onTap: () {
                    info.getFocusTags.length == 1 &&
                            info.getFocusTags[0] == "Education"
                        ? info.setFocusTags = info.getFocusTags
                        : info.setFocusTags = selectedChips;
                    info.setEditTagDialog = false;
                  },
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        //clipBehavior: Clip.hardEdge,
                        color: appBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                Expanded(child: SizedBox(width: 1.0)),
                                GestureDetector(
                                    onTap: () {
                                      info.getFocusTags.length == 1 &&
                                              info.getFocusTags[0] ==
                                                  "Education"
                                          ? info.setFocusTags =
                                              info.getFocusTags
                                          : info.setFocusTags = selectedChips;
                                      info.setEditTagDialog = false;
                                    },
                                    child: cancelWidget())
                              ],
                            ),
                            const Text(
                              "Change the posts you see",
                              style: unselectedTabTextStyle,
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              height: 0.5,
                              color: defaultTextColor,
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    info.setFocusTags = [];
                                    selectedChips = [];
                                    firstSelected = List.filled(length, false);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("clear",
                                        style: TextStyle(
                                            color: defaultTextColor,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ),
                                Expanded(child: SizedBox(width: 1.0)),
                                GestureDetector(
                                  onTap: () {
                                    info.getFocusTags.length == 1 &&
                                            info.getFocusTags[0] == "Education"
                                        ? info.setFocusTags = info.getFocusTags
                                        : info.setFocusTags = selectedChips;
                                    info.setEditTagDialog = false;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text("done",
                                        style: TextStyle(
                                            color: defaultTextColor,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              ],
                            ),
                            // TODO: SWITCH TO LAYOUT GRID
                            GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 170.0,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing: 1.0,
                                ),
                                itemCount: tagSuggestions.length,
                                itemBuilder: (context, itemCount) {
                                  return InputChip(
                                    selected: firstSelected[itemCount],
                                    selectedColor:
                                        colors[itemCount % colors.length],
                                    labelStyle: TextStyle(color: Colors.white),
                                    label: Text(
                                      tagSuggestions[itemCount],
                                    ),
                                    checkmarkColor: Colors.white,
                                    backgroundColor:
                                        colors[itemCount % colors.length],
                                    onPressed: () {
                                      !selectedChips.contains(
                                              tagSuggestions[itemCount])
                                          ? selectedChips
                                              .add(tagSuggestions[itemCount])
                                          : selectedChips.remove(
                                              tagSuggestions[itemCount]);
                                      setState(() {
                                        firstSelected[itemCount] == false
                                            ? firstSelected[itemCount] = true
                                            : firstSelected[itemCount] = false;
                                      });
                                    },
                                  );
                                  // GridView.count(
                                  //   shrinkWrap: true,
                                  //   crossAxisSpacing: 3.0,
                                  //   crossAxisCount: 3,
                                  //   children: chips,
                                  // )
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
              ]),
            );
    });
  }
}
