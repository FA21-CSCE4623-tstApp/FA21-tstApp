import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';

class TagSelectionScreen extends StatefulWidget {
  const TagSelectionScreen({Key? key}) : super(key: key);

  @override
  _TagSelectionScreenState createState() => _TagSelectionScreenState();
}

class _TagSelectionScreenState extends State<TagSelectionScreen> {
  bool _firstselected = false;
  bool _secondselected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.75),
                blurRadius: 7,
                spreadRadius: 10,
                offset: Offset(0, 2)),
          ],
          // borderRadius: BorderRadius.all(Radius.circular(20)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          color: appBackground,
        ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        height: 275,
        child: Column(
          children: <Widget>[
             Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close_sharp,
                  ),
                ),
              ),
            Row(children:  [
              InputChip(
                  selected: _firstselected,
                  label: Text('High School'),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: lightPurple,
                  selectedColor: lightPurple,
                  onPressed: () {
                    setState(() {
                      _firstselected = !_firstselected;
                    });
                  }
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: InputChip(
                    selected: _secondselected,
                    label: Text('Teacher Hacks'),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: lightPurple,
                    selectedColor: lightPurple,

                    onPressed: () {
                      setState(() {
                        _secondselected = !_secondselected;
                      });
                    }
                ),
              ),


              //   initialValue: [ "Cool people", "Decoration",
              //   //  AppProfile("Teacher Hacks", "Decorations", "Teaching Tips"),
              //   ],
              //   onChanged: (List<dynamic> value) {
              // },
              //   findSuggestions: (String query) {
              //    // const Duration(seconds: 5);
              //     return Future.delayed(Duration(seconds: 5));
              //
              // },
              //   chipBuilder: (BuildContext context, ChipsInputState<dynamic> state, data) {
              //     return InputChip(label: Text(
              //       "Cool stuff"
              //     ),
              //
              //     );
              // },
              //   suggestionBuilder: (BuildContext context, ChipsInputState<Object?> state, Object? data) {
              //     return ListTile(
              //       title: Text("COOL"),
              //     );
              // },
                // label: Text(
                //   "Cool",
                //   style: defaultChipTextStyle,
                // ),
                // backgroundColor: lightPurple,
              Padding(
                padding: EdgeInsets.all(4.0),
              ),
            ]),
          ],
        ),
    ),
      ),
    );


  }
}
