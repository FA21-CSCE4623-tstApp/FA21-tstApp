import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tst_app/data/teacher_bulletin_data.dart';
import '../../styles.dart';
import 'package:provider/provider.dart';
import '../../shared_components/widgets.dart';
import 'edit_tags.dart';

import 'blog_screen.dart';
import 'teacher_bulletin_widgets.dart';

import 'post_dialog.dart';
import '../../helper_functions.dart';

class TeacherBulletin extends StatefulWidget {
  static String route = 'teacher_bulletin_screen';
  TeacherBulletin({Key? key}) : super(key: key);

  @override
  State<TeacherBulletin> createState() => _TeacherBulletinState();
}

// these bools are used for tab selection at bottom of screen
bool isSavedTabSelected = true;
bool isLikedTabSelected = false;

class _TeacherBulletinState extends State<TeacherBulletin> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: appBackground,
            appBar: AppBar(
              elevation: 1.0,
              iconTheme: const IconThemeData(color: Colors.black38),
              backgroundColor: lightBrown,
              title: const Text(
                'Teacher\'s Bulletin',
                style: TextStyle(fontSize: 20.0, color: defaultTextColor),
              ),
            ),
            body: Padding(
              padding: defaultScreenPadding,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.0),
                          child: Text(
                            "Change What You See",
                            style: unselectedTabTextStyle,
                          ),
                        ),

                        // 1st column ... "I want to focus on..."
                        Row(
                          children: [
                            const Text(
                              "I want blogs that focus on...",
                              style: TextStyle(
                                color: defaultTextColor,
                              ),
                            ),
                            const Expanded(child: SizedBox(width: 1.0)),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  info.setEditTagDialog = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("+ edit",
                                    style: TextStyle(
                                        color: defaultTextColor,
                                        fontWeight: FontWeight.w700)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          height: 30.0,
                          child: info.getFocusTags.length == 0
                              ? Center(
                                  child: Text(
                                  "choose a tag to get started",
                                  style: TextStyle(
                                      color: defaultTextColor,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600),
                                ))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: info.getFocusTags.length,
                                  itemBuilder: (context, itemCount) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Chip(
                                        backgroundColor: purpleAccent,
                                        label: Text(
                                          info.getFocusTags[itemCount],
                                          style: defaultChipTextStyle,
                                        ),
                                      ),
                                    );
                                  }),
                        ),
                        // const Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Chip(
                        //     backgroundColor: purpleAccent,
                        //     label: Text(
                        //       "Educators",
                        //       style: defaultChipTextStyle,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 50.0),
                        // 2nd row "I want to see blogs that..."
                        // const Text(
                        //   "I want to see blogs that...",
                        //   style: TextStyle(
                        //     color: defaultTextColor,
                        //   ),
                        // ),
                        // const SizedBox(width: 1.0),
                        // const Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Chip(
                        //     backgroundColor: purpleAccent,
                        //     label: Text(
                        //       "K4",
                        //       style: defaultChipTextStyle,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 20.0),
                        // // 3rd row "I would like to see posts that... "
                        // const Text(
                        //   "I want blogs that focus on...",
                        //   style: TextStyle(
                        //     color: defaultTextColor,
                        //   ),
                        // ),
                        // const SizedBox(width: 10.0),
                        // SizedBox(
                        //     height: 50.0,
                        //     child: ListView.builder(
                        //         scrollDirection: Axis.horizontal,
                        //         itemCount: 2,
                        //         itemBuilder: (BuildContext context, int index) {
                        //           List tags = ["Inspiration", "K5"];
                        //           return Chip(
                        //             backgroundColor: purpleAccent,
                        //             label: Text(
                        //               tags[index],
                        //               style: defaultChipTextStyle,
                        //             ),
                        //           );
                        //         })),

                        Padding(
                          padding: defaultSectionPadding,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                    color: defaultTextColor, height: 0.5),
                              ),
                              Row(
                                children: [
                                  const Text("Add a Post",
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: defaultTextColor)),
                                  const Expanded(child: SizedBox(width: 10.0)),
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      info.setShowScreen = true;
                                      info.clearFields();
                                    }),
                                    child: Container(
                                      decoration: defaultRoundedCorners(),
                                      child: const Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "add",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                    color: defaultTextColor, height: 0.5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: defaultSectionPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLikedTabSelected = false;
                                          isSavedTabSelected = true;
                                        });
                                      },
                                      child: Text(
                                        "Recent",
                                        style: isSavedTabSelected
                                            ? selectedTabTextStyle
                                            : unselectedTabTextStyle,
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSavedTabSelected = false;
                                          isLikedTabSelected = true;
                                        });
                                      },
                                      child: Text(
                                        "Saved",
                                        style: isLikedTabSelected
                                            ? selectedTabTextStyle
                                            : unselectedTabTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlogPostSection(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlogScreen(),
          EditTagsDialog()
        ],
      );
    });
  }
}

class BlogPostSection extends StatefulWidget {
  final int index;

  const BlogPostSection({this.index = 0});

  @override
  State<BlogPostSection> createState() => _BlogPostSectionState();
}

class _BlogPostSectionState extends State<BlogPostSection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TBData>(builder: (context, info, child) {
      return FutureBuilder(
          future: info.postData,
          builder: (context, db) {
            if (db.hasData) {
              info.arePostsLoaded = true;
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
                "assets/images/teacher_bulletin/pencil_crayon.png"
              ];
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length - 1,
                  itemBuilder: (context, item) {
                    return Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
                        child: (item % 2) == 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    info.postBackgroundColor = backgroundColors[
                                        item % backgroundColors.length];
                                    info.postImagePath =
                                        images[item % images.length];
                                    info.postTags = posts[item]["tags"];
                                    info.postAuthor =
                                        formatName(posts[item]["author"]);
                                    info.postDate = timestampToDateFormat(
                                        posts[item]["created_date"] ??
                                            Timestamp.now());
                                    info.postBody = formatTextWithParagraphs(
                                        posts[item]["body"]);
                                    info.postTitle =
                                        formatTitle(posts[item]["title"]);
                                    Navigator.pushNamed(
                                        context, DialogScreen.route);
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          height: 100.0,
                                          child: Image.asset(
                                            images[item % images.length],
                                            fit: BoxFit.cover,
                                          ),
                                          decoration: defaultRoundedCorners(
                                              background: backgroundColors[
                                                  item %
                                                      backgroundColors
                                                          .length])),
                                    ),
                                    const SizedBox(width: 20.0),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                  formatTitle(
                                                      posts[item]["title"]),
                                                  style: const TextStyle(
                                                      fontSize: 17.0,
                                                      color: defaultTextColor,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 10.0,
                                                  width: 10.0,
                                                  decoration:
                                                      defaultRoundedCorners(),
                                                ),
                                                const SizedBox(width: 10.0),
                                                const Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    "submitted by: ",
                                                    style: TextStyle(
                                                        color: defaultTextColor,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                      formatName(posts[item]
                                                          ["author"]),
                                                      style: const TextStyle(
                                                          color:
                                                              defaultTextColor,
                                                          fontSize: 14.0)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10.0),
                                            SizedBox(
                                                height: 30.0,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: (posts[item]
                                                            ["tags"])
                                                        .length,
                                                    itemBuilder:
                                                        (context, tagIndex) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Chip(
                                                          backgroundColor:
                                                              purpleAccent,
                                                          label: Text(
                                                            posts[item]["tags"]
                                                                [tagIndex],
                                                            style:
                                                                defaultChipTextStyle,
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
                                    info.postBackgroundColor = backgroundColors[
                                        item % backgroundColors.length];
                                    info.postImagePath =
                                        images[item % images.length];
                                    info.postTags = posts[item]["tags"];
                                    info.postAuthor =
                                        formatName(posts[item]["author"]);
                                    info.postDate = timestampToDateFormat(
                                        posts[item]["created_date"] ??
                                            Timestamp.now());
                                    info.postBody = formatTextWithParagraphs(
                                        posts[item]["body"]);
                                    info.postTitle =
                                        formatTitle(posts[item]["title"]);
                                    Navigator.pushNamed(
                                        context, DialogScreen.route);
                                  });
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                formatTitle(
                                                    posts[item]["title"]),
                                                style: const TextStyle(
                                                    fontSize: 17.0,
                                                    color: defaultTextColor,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 10.0,
                                                  width: 10.0,
                                                  decoration:
                                                      defaultRoundedCorners(),
                                                ),
                                                const SizedBox(width: 10.0),
                                                const Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    "submitted by: ",
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: defaultTextColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                      formatName(posts[item]
                                                          ["author"]),
                                                      style: const TextStyle(
                                                          color:
                                                              defaultTextColor,
                                                          fontSize: 14.0)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10.0),
                                            SizedBox(
                                                height: 30.0,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: (posts[item]
                                                            ["tags"])
                                                        .length,
                                                    itemBuilder:
                                                        (context, tagIndex) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Chip(
                                                          backgroundColor:
                                                              purpleAccent,
                                                          label: Text(
                                                            posts[item]["tags"]
                                                                [tagIndex],
                                                            style:
                                                                defaultChipTextStyle,
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
                                              background: backgroundColors[
                                                  item %
                                                      backgroundColors.length]),
                                          child: Image.asset(
                                              images[item % images.length],
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                              ));
                  });
            } else {
              info.arePostsLoaded = false;
              return smallLoadingIndicator();
            }
          });
    });
  }
}
