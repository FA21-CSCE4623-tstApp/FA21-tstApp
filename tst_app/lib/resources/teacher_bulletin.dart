import 'package:flutter/material.dart';


class TeacherBulletin extends StatelessWidget {
  static String route = 'teacher_bulletin_screen';
  final Color backgroundColor = Color(0xFFFFFBEF);
  // TODO: make amt around edges the same
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: backgroundColor,
        title: Text(
          'Teacher Bulletin',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
    SliverList(
    delegate: SliverChildListDelegate(
    [
        Placeholder(
          fallbackWidth: 100.0,
          fallbackHeight: 200.0,
          color: Colors.indigo
        )
          ],
            ),),
          ],
        ),
      ),
    );
  }
}
