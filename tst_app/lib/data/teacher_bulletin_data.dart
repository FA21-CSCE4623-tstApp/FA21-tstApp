// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

class TBData extends ChangeNotifier {
  final CollectionReference blogPost =
  FirebaseFirestore.instance.collection('Blog_Posts');
  
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


  Future createBlogPosts() async{
    List postData = [{
      'title': getTitle(),
      'body': getBody(),
      'created_time':  Timestamp.now(),
      'tags': getTags(),
      'author': getAuthor(),
    }];
    print(postData);
    print('button clicked');
    //change vvv to post so in one collection
    return blogPost
        .doc()
        .set({
      'title': getTitle(),
      'body': getBody(),
      'created_time':  Timestamp.now(),
      'tags': getTags(),
      'author': getAuthor(),
    })
        .then((value) => print("Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  List<String> fields = ['blogTitle', 'blogAuthor', 'blogBody'];
  void clearFields(){
    fields.clear();
    notifyListeners();
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
    notifyListeners();
  }

  String blogTitle = "";
  String getTitle(){
    return blogTitle;
  }

  void setTitle(String title){
    blogTitle = title;
  }


  String blogBody = "";
  String getBody(){
    return blogBody;
  }
  void setBody(String body){
    blogBody = body;
  }

  String blogAuthor = "";
  String getAuthor(){
    return blogAuthor;
  }

  void setAuthor(String author){
    blogAuthor = author;
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
  bool arePostsLoaded = false;
  bool get getAreRelevantPostsLoaded => arePostsLoaded;
  void set setAreRelevantPostsLoaded(bool postsLoaded) {
    arePostsLoaded = postsLoaded;
    notifyListeners();
  }

  bool isFirstRun = false; // used to show "on first run"

  //  getters and setters
  Future get postData => _getBlogPosts();
  bool get showScreen => getShowScreen();
  Future get blogData => createBlogPosts();
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
