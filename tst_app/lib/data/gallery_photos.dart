// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryPhotos extends ChangeNotifier{
  // final String description;
  // final String photo;
  // final String title;

  // GalleryPhotos({this.description, this.photo});

  // factory GalleryPhotos.fromJson(Map<String, dynamic> json) {
  //   return GalleryPhotos(description: '', photo: '');
  // }

  // String _json = "https://graph.facebook.com/v9.0/112387216836055/feed?pretty=0&fields=created_time%2Cid%2Cfull_picture%2Cmessage";
  // String _accessToken = "EAA9nZAM7qBEIBAOTrHcaRsi93AB0ZCDNcmzZA05MCMEL8slSuZBRzUdIISn0ibo1wvbIlgv9FbdQ8z9IlO5RI3j0y0P9FkALjmF65xUe7bNOSWm00I0gZB2GwPNEKZCLCdZBVfqDyXulpkDxkz2EeXCNeQIf1YbnAzNwc1SOWmZCTvcrRWZCd0HpW1AG5AsGQ5lZAxLYZB1saZAr3wZDZD";

  // String _json = "graph.facebook.com/112387216836055/";
  // String _accessToken = "";
 
 Future fetchPhotos() async {
   http.Response response;
   response = await http.get(Uri.parse("https://graph.facebook.com/v9.0/112387216836055/feed?fields=id%2Cmessage%2Cfull_picture&access_token=_pageAccessToken"));
   if(response.statusCode == 200){
     return response.body;
   } else {
    //  print("$_json&$_accessToken");
     print('error: ${response.statusCode}');
     return null;
   }

 }

//  getters and setters
Future get photoInfo => fetchPhotos();
// String get testInt => 'test';


}
