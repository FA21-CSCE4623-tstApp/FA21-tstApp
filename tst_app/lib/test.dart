import 'package:flutter/material.dart';
import 'package:tst_app/internet_stuff/gallery_photos.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  static String route = 'test';

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryPhotos>(builder: (context, info, child) {
      Future photos = info.photoInfo;
      // return Container(color: Colors.red[300],);
      return Scaffold(
          backgroundColor: Colors.red.shade50,
          body: FutureBuilder(
            future: photos,
            builder: (context, photoInfo) {
              if (photoInfo.hasData) {
                return Container(
                  color: Colors.amber.shade100,
                  // child: SafeArea(child: ListView(children: [Text('${photoInfo.data().toString()}')],),)
                );
              } else {
                return Container(
                  color: Colors.blueGrey[300],
                );
              }
            },
          ));
    });
  }
}
