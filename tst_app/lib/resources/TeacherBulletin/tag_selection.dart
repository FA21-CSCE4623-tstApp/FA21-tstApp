import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tst_app/data/teacher_bulletin_data.dart';
import 'package:tst_app/resources/TeacherBulletin/teacher_bulletin.dart';
import '../../styles.dart';

class TagSelectionScreen extends StatefulWidget {
  static String route = 'tag_selection';

  const TagSelectionScreen({Key? key}) : super(key: key);

  @override
  _TagSelectionScreenState createState() => _TagSelectionScreenState();
}

class _TagSelectionScreenState extends State<TagSelectionScreen> {

  List<String> tagSuggestions = <String>[
    'High School',
    'Middle School',
    'College',
    'Elementary',
    'Teacher Hacks',
    'Lunch Ideas',
    'Holiday Season',
    'Decoration Ideas'
  ];


  List<bool> firstSelected = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (consumerContext, info, child)
    {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(.25),
                blurRadius: 5,
                spreadRadius: 10,
                offset: Offset(0, 2)),
          ],
          // borderRadius: BorderRadius.all(Radius.circular(20)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: appBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: const Icon(
                      Icons.drag_handle_sharp
                  ),
                ),
                Center(
                  child: Container(
                      height: 30.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tagSuggestions.length,
                          //(info.postTags.length),
                          itemBuilder: (context, tagIndex) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                              child: InputChip(
                                selected: firstSelected[tagIndex],
                                label: Text(tagSuggestions[tagIndex]),
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor:  Colors.deepPurpleAccent,
                                // change icon, brown or defaultTextColor
                                selectedColor: lightPurple,
                                onPressed: () {
                                  setState(() {
                                    firstSelected[tagIndex] == false
                                        ? firstSelected[tagIndex] = true
                                        : firstSelected[tagIndex] = false;
                                    if(firstSelected[tagIndex] == false){
                                      info.clearTag(tagSuggestions[tagIndex]);
                                    }
                                    else{
                                      info.setTags = tagSuggestions[tagIndex];
                                    }
                                    debugPrint(firstSelected[0].toString());
                                    //   _firstselected = !_firstselected;
                                  });
                                  //firstSelected[tagIndex] = false;
                                  debugPrint(
                                      tagSuggestions.length.toString());
                                  debugPrint(
                                      tagSuggestions[tagIndex].toString());
                                },
                              ),
                            );
                          })
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
