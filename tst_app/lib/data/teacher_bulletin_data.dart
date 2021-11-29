// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

class TBData extends ChangeNotifier {
  final CollectionReference post =
  FirebaseFirestore.instance.collection('Posts');
  Future _getBlogPosts() async {
    // get document from firebase
    //return default value if error

    try {
      var docSnapshot = await post.get();
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
          'author': 'example user'
        }
      ];
      print("ERROR: $e");
      return emptyPostData;
    }
  }



  Future createBlogPosts() async{
    List postData = [{
      'title': 'default title',
      'body': 'default body',
      'created_time': 0,
      'tags': ['no tags'],
      'author': 'example user'
    }];
    print(postData);
    print('button clicked');
    return post
        .doc()
        .set({
      'title': 'default title',
      'body': 'default body',
      'created_time': 0,
      'tags': ['no tags'],
      'author': 'example user'
    })
        .then((value) => print("Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  bool choice = false;
  bool getShowScreen() {
    return choice;
  }


  List<String> userTags = [];
  List<String> getTags(){

    return userTags;
  }

  void set setTags(String choice){
   // userTags.add(choice);
    isDuplicate(choice);
    notifyListeners();
  }

  void clearTags(){
    userTags.clear();
    notifyListeners();
  }

  void clearTag(String choice){
    userTags.remove(choice);
    // userTags.removeAt(index);
    notifyListeners();
  }

  void isDuplicate(String choice){
    if(!userTags.contains(choice)){
      userTags.add(choice);
    }
  }


  // used to display information on post dialog that pops up
  Color postBackgroundColor = Colors.transparent; // used to show post image
  String postImagePath =
      "assets/images/teacher_bulletin/pencil_crayon.png"; // used to show post image

  String postTitle = "";
  String postBody = "";
  String postAuthor = "";
  String postDate = "";
  List postTags = [];
  bool areRelevantPostsLoaded = false;

  //  getters and setters
  Future get postData => _getBlogPosts();
  bool get showScreen => getShowScreen();
  List<String> get postTag => getTags();

  void set setShowScreen(bool show) {
    choice = show;
    notifyListeners();
  }

  Future onRefreshTeacherBulletin() async {
    //TODO: implement this
    const Duration(seconds: 5);
  }
}
