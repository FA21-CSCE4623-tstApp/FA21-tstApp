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
    List<Map> emptyPostData = [
      {
        'title': 'default title',
        'body': 'default body',
        'created_time': 0,
        'tags': ['no tags'],
        'username': 'example user'
      }
    ];

    try {
      var docSnapshot = await collectionReference.get();
      if (docSnapshot.docs.isNotEmpty) {
        List postListData = [];
        docSnapshot.docs.forEach((doc) => {postListData.add(doc.data())});
        // print("Post List Data $postListData");
        return postListData;
      }
    } catch (e) {
      print("ERROR: $e");
      return emptyPostData;
    }
  }

  //  getters and setters
  Future get postData => _getBlogPosts();
}
