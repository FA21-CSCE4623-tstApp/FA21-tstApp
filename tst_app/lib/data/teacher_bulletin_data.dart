// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

class TBData extends ChangeNotifier {
  Future _getBlogPosts() async {
    // get document from firebase
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Posts');

    //return default value if error

    try {
      var docSnapshot = await collectionReference.get();
      if (docSnapshot.docs.isNotEmpty) {
        List postListData = [];
        docSnapshot.docs.forEach((doc) => {postListData.add(doc.data())});
        return postListData;
      }
    } catch (e) {
      List emptyPostData = [
        {
          'title': 'default title',
          'body': 'default body',
          'created_time': 0,
          'tags': ['no tags'],
          'username': 'example user'
        }
      ];
      print("ERROR: $e");
      return emptyPostData;
    }
  }

  bool choice = false;
  bool getShowScreen() {
    return choice;
  }

  // used to display information on post dialog that pops up
  Color postBackgroundColor = Colors.transparent; // used to show post image
  String postImagePath =
      "assets/images/teacher_bulletin/pencil_crayon.png"; // used to show post image

  //  getters and setters
  Future get postData => _getBlogPosts();
  bool get showScreen => getShowScreen();
  void set setShowScreen(bool show) {
    choice = show;
    notifyListeners();
  }
}
