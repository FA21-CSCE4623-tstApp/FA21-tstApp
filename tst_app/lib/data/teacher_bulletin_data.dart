// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

class TBData extends ChangeNotifier {
  final CollectionReference blogPost =
      FirebaseFirestore.instance.collection('Posts');

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
        print("PRINT BLOG POSTS: ${postListData.length}");
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

  Future createBlogPosts() async {
    List postData = [
      {
        'title': getTitle(),
        'body': getBody(),
        'created_time': Timestamp.now(),
        'tags': getTags(),
        'author': getAuthor(),
      }
    ];
    print(postData);
    print('button clicked');
    //change vvv to post so in one collection
    if (getTitle().length == 0 ||
        getBody().length == 0 ||
        getAuthor().length == 0) {
      print("post not added");
      isBlogSuccess = false;
      return null;
    }
    return blogPost.doc().set({
      'title': getTitle(),
      'body': getBody(),
      'created_time': Timestamp.now(),
      'tags': getTags(),
      'author': getAuthor(),
    }).then((value) {
      print("Added");
      isBlogSuccess = true;
    }).catchError((error) {
      print("Failed to add user: $error");
      isBlogSuccess = false;
    });
  }

  List<String> fields = ['blogTitle', 'blogAuthor', 'blogBody'];
  void clearFields() {
    fields.clear();
    notifyListeners();
  }

  bool getShowScreen() {
    return choice;
  }

  List<String> getTags() {
    return userTags;
  }

  void clearTags() {
    userTags.clear();
    notifyListeners();
  }

  void clearTag(String choice) {
    userTags.remove(choice);
    notifyListeners();
  }

  void isDuplicate(String choice) {
    if (!userTags.contains(choice)) {
      userTags.add(choice);
    }
  }

  Future onRefreshTeacherBulletin() async {
    //TODO: implement this
    const Duration(seconds: 5);
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
  bool arePostsLoaded = false;
  List focusTags = ["Educators"]; // for "i want blogs that foucs on..."
  bool isFirstRun = false; // used to show "on first run" screen
  bool showEditTag = false;
  List<String> userTags = [];
  String blogTitle = "";
  String blogBody = "";
  bool choice = false; // for "set show screen"
  bool isBlogSuccess = false;

  //  getters and setters
  Future get postData => _getBlogPosts();
  bool get showScreen => choice;
  Future get blogData => createBlogPosts();
  List<String> get postTag => getTags();
  bool get showEditTagDialog => showEditTag;
  List get getFocusTags => focusTags;
  bool get getAreRelevantPostsLoaded => arePostsLoaded;
  bool get getIsBlogSuccess => isBlogSuccess;

  void set setShowScreen(bool show) {
    choice = show;
    notifyListeners();
  }

  void set setTags(String choice) {
    // userTags.add(choice);
    isDuplicate(choice);
    notifyListeners();
  }

  String getTitle() {
    return blogTitle;
  }

  String getBody() {
    return blogBody;
  }

  String blogAuthor = "";
  String getAuthor() {
    return blogAuthor;
  }

  void setBody(String body) {
    blogBody = body;
  }

  void setAuthor(String author) {
    blogAuthor = author;
  }

  void set setEditTagDialog(bool show) {
    showEditTag = show;
    notifyListeners();
  }

  void setTitle(String title) {
    blogTitle = title;
  }

  void set setAreRelevantPostsLoaded(bool postsLoaded) {
    arePostsLoaded = postsLoaded;
    notifyListeners();
  }

  void set setFocusTags(List choice) {
    focusTags = choice;
    notifyListeners();
  }
}
