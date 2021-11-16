import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return !info.showScreen
          ? Container()
          : Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print("close post dialog");
                      info.setShowScreen = false;
                    });
                  },
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: Container(
                      color: Colors.black45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 30.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        Container(color: appBackground),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: info.postBackgroundColor,
                                ),
                                height: 80.0,
                                width: 80.0,
                                child: Image.asset(
                                  info.postImagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox(width: 1.0)),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: cancelWidget(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
