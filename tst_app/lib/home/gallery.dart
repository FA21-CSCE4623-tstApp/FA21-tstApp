import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tst_app/home/home_screen.dart';
import '../data/gallery_photos.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

const Color backgroundColor = Color(0xFFFFFBEF);
const Color textColor = Colors.black87;
final Color? placeholderColor = Colors.amber[100];


Future fetchHTTP(String url) async {
  var result = await http.get(Uri.parse(url));
  try {
    return await json.decode(result.body);
  } catch (e) {
    print(json.decode(result.body));
  }
}

String _pageAccessToken =
    "EAA9nZAM7qBEIBACfwpc7rfAIvRGfFBTptw7kQWxZC7xbNSHBnExkI9u8ONKXvhVjS9hgSTbCwHZBWZAhG41VlVeZBYZCVmeFBFkFQJ7wbriJK5Wy9EZAYm9K7UuQPEg8cqUNb7rxho1KdZASrM05xM6k5ifb6dYazT2CmDD8I8yKKwZDZD";
// get all album ids
List albumIDs = List.filled(5, {'name': '', 'created_time': '', 'albumID': ''});
void getAlbumIDs() async {
  // TODO: get long term access token (read only)
  var _url =
      "https://graph.facebook.com/v9.0/112387216836055/albums?limit=5&access_token=$_pageAccessToken";

  var a = await fetchHTTP(_url);
  try {
    for (int i = 0; i < 5; i++) {
      albumIDs[i] = {
        'name': a['data'][i]['name'],
        'created_time': a['data'][i]['created_time'],
        'albumID': a['data'][i]['id']
      };
    }
  } catch (e) {
    print(a);
  }

  getPictures();
}

// gets links to pictures and description stored in album
List pictureInfo = List.filled(5, {
  'pictureID': '',
  'created_time': '',
  'name': ''
}); //grabs raw info on images
List images =
    List.filled(25, {'image': null}); //grabs actual images to be used in gallery
void getPictures() async {
  // get 10 pics from our the 5 most recent albums
  for (int i = 0; i < 5; i++) {
    // print('${i+1}: $images');
    var _url =
        "https://graph.facebook.com/v9.0/${albumIDs[i]['albumID']}/photos?limit=5&access_token=$_pageAccessToken";
    var b = await fetchHTTP(_url);
    for (int j = 0; j < 5; j++) {
      try {
        pictureInfo[j] = {
          'pictureID': b['data'][j]['id'],
          'created_time': b['data'][j]['created_time'],
          'name': b['data'][j]['name']
        };
      } catch (e) {
        print(b);
      }
    }
    //grab the 5 pics from each album
    for (int k = 0; k < 5; k++) {
      var _url =
          "https://graph.facebook.com/v9.0/${pictureInfo[k]['pictureID']}?fields=images&access_token=$_pageAccessToken";
      // print("URL: $_url");
      var c = await fetchHTTP(_url);
      try {
        images[k] = {'image': c['images'][0]['source']};
      } catch (e) {
        print(c);
      }
    }
  }
}

class Gallery extends StatefulWidget {
  static const route = 'gallery_screen';

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // Future<GalleryPhotos> futureAlbum;

  @override
  Widget build(BuildContext context) {
    // print(images);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading:
                  false, // removes the back button on top app bar
              pinned: true,
              expandedHeight: 100.0,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FontAwesomeIcons.times,
                        size: 15.0,
                      ),
                      backgroundColor: textColor,
                    ),
                  ),
                ),
              ],
              backgroundColor: backgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.only(left: 10.0),
                title: Text(
                  'Gallery',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: placeholderColor,
                        width: 300.0,
                        height: 300.0,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 100.0),
                    child: Container(),
                  ),
                ],
              ),
            ),
            GridPictures(),
          ],
        ),
      ),
    );
  }
}

class GridPictures extends StatefulWidget {
  @override
  _GridPicturesState createState() => _GridPicturesState();
}

class _GridPicturesState extends State<GridPictures> {
  @override
  void initState() {
    getAlbumIDs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("IMAGES in build method: ${images.length}");
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        // childAspectRatio: 1.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          print("${index+1}: ${images[index]['image']}");
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: placeholderColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(images[index]['image'] ??  'https://scontent-dfw5-2.xx.fbcdn.net/v/t1.6435-9/184038515_523298925744880_8415787244077800134_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=110474&_nc_ohc=Vf5fgREi-CsAX_XGfCs&_nc_ht=scontent-dfw5-2.xx&oh=b39167f49d4e780ee669466e4e692e72&oe=60C17A49'),
              ));
        },
        childCount: 25,
      ),
    );
  }
}

/*
Image.network(
                        'https://scontent-dfw5-2.xx.fbcdn.net/v/t1.6435-9/184038515_523298925744880_8415787244077800134_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=110474&_nc_ohc=Vf5fgREi-CsAX_XGfCs&_nc_ht=scontent-dfw5-2.xx&oh=b39167f49d4e780ee669466e4e692e72&oe=60C17A49',
                        fit: BoxFit.cover) ?? Image.network(images[index]['image']),
                         */