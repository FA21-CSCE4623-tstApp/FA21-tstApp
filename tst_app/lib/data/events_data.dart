// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;

class AEData extends ChangeNotifier {
  Future<List> _getEvents() async {
    // get document from firebase
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Events');

    //return default value if error
    List<Map> emptyPostData = [
      {
        'title': 'default title',
        'event_description': 'default description',
        'date_time': 'default time',
        'host': 'default host',
        'main_picture': '',
        'event_location': 'default address'
      }
    ];

    try {
      var docSnapshot = await collectionReference.get();
      if (docSnapshot.docs.isNotEmpty) {
        List eventListData = [];
        docSnapshot.docs.forEach((doc) => {eventListData.add(doc.data())});
        // print("Post List Data $postListData");
        return eventListData;
      }
    } catch (e) {
      print("ERROR: $e");
      return emptyPostData;
    }
    return emptyPostData;
  }

  //  getters and setters
  Future get eventData => _getEvents();
}