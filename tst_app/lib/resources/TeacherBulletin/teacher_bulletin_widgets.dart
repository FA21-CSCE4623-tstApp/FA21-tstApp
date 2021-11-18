import 'package:flutter/material.dart';
import 'package:tst_app/styles.dart';
import 'package:provider/provider.dart';
import '../../data/teacher_bulletin_data.dart';
import 'helper_functions.dart';
import '../../shared_components/widgets.dart';

Widget likePostWidget({bool selected = false}) {
  Color iconColor = Colors.white54;
  Color backgroundColor = Colors.black54;
  if (selected) {
    iconColor = Colors.black;
    backgroundColor = Colors.white;
  } else {
    iconColor = Colors.white54;
    backgroundColor = Colors.black54;
  }
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.thumb_up,
          color: iconColor,
          size: 15.0,
        ),
      ),
    ),
  );
}

Widget dislikePostWidget({bool selected = false}) {
  Color iconColor = Colors.white54;
  Color backgroundColor = Colors.black54;
  if (selected) {
    iconColor = Colors.black;
    backgroundColor = Colors.white;
  } else {
    iconColor = Colors.white54;
    backgroundColor = Colors.black54;
  }
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.thumb_down,
          color: iconColor,
          size: 15.0,
        ),
      ),
    ),
  );
}

Widget sharePostWidget({bool selected = false}) {
  Color iconColor = Colors.white54;
  Color backgroundColor = Colors.black54;
  if (selected) {
    iconColor = Colors.black;
    backgroundColor = Colors.white;
  } else {
    iconColor = Colors.white54;
    backgroundColor = Colors.black54;
  }

  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.share,
          color: iconColor,
          size: 15.0,
        ),
      ),
    ),
  );
}

Widget reportPostWidget({bool selected = false}) {
  Color iconColor = Colors.white54;
  Color backgroundColor = Colors.black54;
  if (selected) {
    iconColor = Colors.black;
    backgroundColor = Colors.white;
  } else {
    iconColor = Colors.white54;
    backgroundColor = Colors.black54;
  }

  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.flag,
          color: iconColor,
          size: 15.0,
        ),
      ),
    ),
  );
}

class RelevantBlogPostsSection extends StatefulWidget {
  const RelevantBlogPostsSection({Key? key}) : super(key: key);

  @override
  _RelevantBlogPostsSectionState createState() =>
      _RelevantBlogPostsSectionState();
}

class _RelevantBlogPostsSectionState extends State<RelevantBlogPostsSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return info.areRelevantPostsLoaded
          ? Column(
              children: List.generate(2, (index) => BlogPosts(index: index)))
          : smallLoadingIndicator();
    });
  }
}

class BlogPosts extends StatefulWidget {
  final int index;

  const BlogPosts({this.index = 0});

  @override
  State<BlogPosts> createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return FutureBuilder(
          future: info.postData,
          builder: (context, db) {
            if (db.hasData) {
              info.areRelevantPostsLoaded = true;
              List posts = (db.data as List).cast();
              // track post background color/image
              List<Color> backgroundColors = [
                mutedIndigo,
                mutedDeepPurple,
                mutedPurple
              ];
              List<String> images = [
                "assets/images/teacher_bulletin/apple.png",
                "assets/images/teacher_bulletin/block.png",
                "pencil_crayon.png"
              ];
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: (widget.index % 2) == 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              // set info to show on post dialog
                              info.postBackgroundColor =
                                  backgroundColors[widget.index];
                              info.postImagePath = images[widget.index];
                              info.postImagePath = images[widget.index];
                              info.postTitle =
                                  formatTitle(posts[widget.index]["title"]);
                              info.postTags = posts[widget.index]["tags"];
                              info.postAuthor =
                                  formatName(posts[widget.index]["author"]);
                              info.postBody = formatTextWithParagraphs(
                                  posts[widget.index]["body"]);
                              info.postDate = timestampToDateFormat(
                                  posts[widget.index]["created_date"]);
                              info.setShowScreen = true;
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                    height: 100.0,
                                    child: Image.asset(
                                      images[widget.index],
                                      fit: BoxFit.cover,
                                    ),
                                    decoration: defaultRoundedCorners(
                                        background:
                                            backgroundColors[widget.index])),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Column(children: [
                                  Text(
                                      formatTitle(posts[widget.index]["title"]),
                                      style: const TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        decoration: defaultRoundedCorners(),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        flex: 5,
                                        child: Text(
                                          "submitted by: ",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                            formatName(
                                                posts[widget.index]["author"]),
                                            style: const TextStyle(
                                                fontSize: 10.0)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  SizedBox(
                                      height: 30.0,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: (posts[widget.index]
                                                  ["tags"])
                                              .length,
                                          itemBuilder: (context, tagIndex) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Chip(
                                                backgroundColor: lightPurple,
                                                label: Text(
                                                  posts[widget.index]["tags"]
                                                      [tagIndex],
                                                  style: defaultChipTextStyle,
                                                ),
                                              ),
                                            );
                                          })),
                                ]),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              // set info to show on post dialog
                              info.postBackgroundColor =
                                  backgroundColors[widget.index];
                              info.postImagePath = images[widget.index];
                              info.postTitle =
                                  formatTitle(posts[widget.index]["title"]);
                              info.postTags = posts[widget.index]["tags"];
                              info.postAuthor =
                                  formatName(posts[widget.index]["author"]);
                              info.postBody = formatTextWithParagraphs(
                                  posts[widget.index]["body"]);
                              info.postDate = timestampToDateFormat(
                                  posts[widget.index]["created_date"]);
                              info.setShowScreen = true;
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(children: [
                                  Text(
                                      formatTitle(posts[widget.index]["title"]),
                                      style: const TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        decoration: defaultRoundedCorners(),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        flex: 5,
                                        child: Text(
                                          "submitted by: ",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                            formatName(
                                                posts[widget.index]["author"]),
                                            style: const TextStyle(
                                                fontSize: 10.0)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  SizedBox(
                                      height: 30.0,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: (posts[widget.index]
                                                  ["tags"])
                                              .length,
                                          itemBuilder: (context, tagIndex) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: Chip(
                                                backgroundColor: lightPurple,
                                                label: Text(
                                                  posts[widget.index]["tags"]
                                                      [tagIndex],
                                                  style: defaultChipTextStyle,
                                                ),
                                              ),
                                            );
                                          })),
                                ]),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Container(
                                    height: 100.0,
                                    decoration: defaultRoundedCorners(
                                        background:
                                            backgroundColors[widget.index]),
                                    child: Image.asset(images[widget.index],
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ));
            } else {
              info.areRelevantPostsLoaded = false;
              return Container();
            }
          });
    });
  }
}
