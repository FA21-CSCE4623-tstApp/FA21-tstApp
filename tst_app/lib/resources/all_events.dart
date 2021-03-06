import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tst_app/data/events_data.dart';
import 'package:tst_app/give/monthly_event.dart';
import 'package:tst_app/styles.dart';
import 'package:tst_app/home/page_components.dart';

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

class AllEvents extends StatelessWidget {
  static const route = 'all_events_screen';
  DateFormat plainDate = DateFormat("yyyy-MM-dd'T'H:m:sZ");
  DateFormat headerDate = DateFormat("MMMM d, yyyy");
  DateFormat exactDate = DateFormat("MMMM d, yyyy 'at' h:mm a");
  final List prevEvents = [];
  final List upcEvents = [];

  Widget getUPCListWidget(List events) {
    if (events.isNotEmpty) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: upcEvents.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          (upcEvents[index]["title"] != null)
                              ? upcEvents[index]["title"]
                              : "Untitled Event",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 20, color: defaultTextColor)),
                      Text(
                          (upcEvents[index]["date_time"] != null)
                              ? headerDate
                                  .format(DateTime.parse(
                                      upcEvents[index]["date_time"]))
                                  .toString()
                              : "Today",
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: defaultTextColor))
                    ],
                  )),
                  GestureDetector(
                      onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return Dialog(
                                  backgroundColor: appBackground,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Container(
                                      height: 450,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: SingleChildScrollView(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, right: 10.0),
                                                height: 430,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            //TODO: Add picture for null case
                                                            upcEvents[index][
                                                                "main_picture"]),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                      top: Radius.circular(15),
                                                    ),
                                                    gradient:
                                                        const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                          lightBrown,
                                                          appBackground
                                                        ],
                                                            stops: [
                                                          0.4,
                                                          0.4
                                                        ])),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                      onTap: () => Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop(),
                                                      child: Container(
                                                        child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white70)),
                                                        decoration: BoxDecoration(
                                                            color: mediumBrown,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                      )),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, right: 8),
                                                  child: Text(
                                                      (upcEvents[index]
                                                                  ["title"] !=
                                                              null)
                                                          ? upcEvents[index]
                                                              ["title"]
                                                          : "Untitled Event",
                                                      style: const TextStyle(
                                                          fontSize: 22))),
                                              const SizedBox(height: 8),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, right: 8),
                                                  child: Text(
                                                      (upcEvents[index][
                                                                  "event_location"] !=
                                                              null)
                                                          ? upcEvents[index]
                                                              ["event_location"]
                                                          : "Virtual Event",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              defaultTextColor))),
                                              const SizedBox(height: 8),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, right: 8),
                                                  child: Text(
                                                      (upcEvents[index][
                                                                  "date_time"] !=
                                                              null)
                                                          ? exactDate
                                                              .format(plainDate
                                                                  .parse(upcEvents[
                                                                          index]
                                                                      [
                                                                      "date_time"]))
                                                              .toString()
                                                          : "Today",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              defaultTextColor))),
                                              const SizedBox(height: 20),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: Text(
                                                      (upcEvents[index][
                                                                  "event_description"] !=
                                                              null)
                                                          ? upcEvents[index][
                                                                  "event_description"]
                                                              .replaceAll(
                                                                  "  ", "\n\n")
                                                          : "",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              defaultTextColor))),
                                              const SizedBox(height: 20),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 60, right: 60),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      color: lightBrown,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Register Now',
                                                          style: TextStyle(
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color:
                                                                defaultTextColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // width: screenWidth - 100,
                                                    height: 40.0,
                                                  )),
                                              const SizedBox(height: 10)
                                            ],
                                          )))));
                            },
                          ),
                      child: const Icon(Icons.arrow_forward_ios,
                          color: accentColor, size: 18.0))
                ],
              ),
            );
          });
    } else {
      return Text("No Upcoming Events",
          style: TextStyle(fontSize: 20, color: defaultTextColor));
    }
  }

  Widget getPrevListWidget(List events) {
    if (events.isNotEmpty) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: prevEvents.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          (prevEvents[index]["title"] != null)
                              ? prevEvents[index]["title"]
                              : "Untitled Event",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 20, color: defaultTextColor)),
                      Text(
                          (prevEvents[index]["date_time"] != null)
                              ? headerDate
                                  .format(DateTime.parse(
                                      prevEvents[index]["date_time"]))
                                  .toString()
                              : "Today",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: defaultTextColor))
                    ],
                  )),
                  GestureDetector(
                      onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return Dialog(
                                  backgroundColor: appBackground,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Container(
                                      height: 450,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: SingleChildScrollView(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, right: 10.0),
                                                height: 430,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            //TODO: Add picture for null case
                                                            prevEvents[index][
                                                                "main_picture"]),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                      top: Radius.circular(15),
                                                    ),
                                                    gradient:
                                                        const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                          lightBrown,
                                                          appBackground
                                                        ],
                                                            stops: [
                                                          0.4,
                                                          0.4
                                                        ])),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                      onTap: () => Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop(),
                                                      child: Container(
                                                        child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white70)),
                                                        decoration: BoxDecoration(
                                                            color: mediumBrown,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                      )),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, right: 8),
                                                  child: Text(
                                                      (prevEvents[index]
                                                                  ["title"] !=
                                                              null)
                                                          ? prevEvents[index]
                                                              ["title"]
                                                          : "Untitled Event",
                                                      style: const TextStyle(
                                                          fontSize: 22))),
                                              const SizedBox(height: 8),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, right: 8),
                                                  child: Text(
                                                      (prevEvents[index][
                                                                  "event_location"] !=
                                                              null)
                                                          ? prevEvents[index]
                                                              ["event_location"]
                                                          : "Virtual Event",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              defaultTextColor))),
                                              const SizedBox(height: 8),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4, right: 8),
                                                  child: Text(
                                                      (prevEvents[index][
                                                                  "date_time"] !=
                                                              null)
                                                          ? exactDate
                                                              .format(plainDate
                                                                  .parse(prevEvents[
                                                                          index]
                                                                      [
                                                                      "date_time"]))
                                                              .toString()
                                                          : "Today",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              defaultTextColor))),
                                              const SizedBox(height: 20),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: Text(
                                                      (prevEvents[index][
                                                                  "event_description"] !=
                                                              null)
                                                          ? prevEvents[index][
                                                                  "event_description"]
                                                              .replaceAll(
                                                                  "  ", "\n\n")
                                                          : "",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              defaultTextColor))),
                                              const SizedBox(height: 20),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 60, right: 60),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      color: lightBrown,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Text(
                                                          'Register Now',
                                                          style: TextStyle(
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color:
                                                                defaultTextColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // width: screenWidth - 100,
                                                    height: 40.0,
                                                  )),
                                              const SizedBox(height: 10)
                                            ],
                                          )))));
                            },
                          ),
                      child: const Icon(Icons.arrow_forward_ios,
                          color: accentColor, size: 18.0))
                ],
              ),
            );
          });
    } else {
      return Text("No Upcoming Events",
          style: TextStyle(fontSize: 20, color: defaultTextColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AEData>(builder: (context, info, child) {
      return FutureBuilder(
          future: info.eventData,
          builder: (context, db) {
            var data = db.data;
            if (db.hasData) {
              List eventData = data as List;
              int numEvents = eventData.length;

              //Populate lists with database data
              for (int i = 0; i < numEvents; i++) {
                Map<String, dynamic> event =
                    Map<String, dynamic>.from(eventData[i]);

                if (DateTime.parse(event["date_time"])
                        .compareTo(DateTime.now()) <
                    0) {
                  prevEvents.add(event);
                } else {
                  upcEvents.add(event);
                }
              }

              return Scaffold(
                backgroundColor: appBackground,
                appBar: AppBar(
                  elevation: 1.0,
                  iconTheme: const IconThemeData(color: Colors.black38),
                  backgroundColor: lightBrown,
                  title: const Text(
                    'All Events',
                    style: TextStyle(fontSize: 20.0, color: defaultTextColor),
                  ),
                ),
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: ExpansionTile(
                                iconColor: accentColor,
                                collapsedIconColor: accentColor,
                                title: const Text(
                                  'Upcoming Events',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: defaultTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                children: [
                                  getUPCListWidget(upcEvents),
                                  const SizedBox(height: 10)
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, right: 20.0),
                            child: ExpansionTile(
                                iconColor: accentColor,
                                collapsedIconColor: accentColor,
                                title: const Text(
                                  'Previous Events',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: defaultTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                children: [
                                  getPrevListWidget(prevEvents),
                                  const SizedBox(height: 10)
                                ]),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 20.0),
                            child: Card(
                              elevation: 2,
                              color: const Color(0xFFFFF7DB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: 400.0,
                                width: double.infinity,
                                child: TableCalendar(
                                  calendarStyle: const CalendarStyle(
                                    markerDecoration: BoxDecoration(
                                        color: accentColor,
                                        shape: BoxShape.circle),
                                    todayDecoration: BoxDecoration(
                                        color: accentColor,
                                        shape: BoxShape.circle),
                                    weekendTextStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    defaultTextStyle: TextStyle(
                                      color: defaultTextColor,
                                    ),
                                  ),
                                  availableCalendarFormats: const {
                                    CalendarFormat.month: 'Month'
                                  },
                                  weekendDays: [],
                                  lastDay: DateTime.utc(2030, 12, 31),
                                  focusedDay: DateTime.now(),
                                  firstDay: DateTime.utc(2020, 1, 1),
                                  eventLoader: (day) {
                                    return _getEventsForDay(day);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 40.0,
                                  bottom: 20.0,
                                  left: 23.0,
                                ),
                                child: Text(
                                  'Featured',
                                  style: TextStyle(
                                      color: defaultTextColor, fontSize: 25.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 40.0),
                                child: Container(
                                  color: Colors.black87,
                                  height: 270.0,
                                  width: double.infinity,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 270.0,
                                        child: Image.asset(
                                          'assets/images/TeachersLounge.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        height: 270.0,
                                        width: double.infinity,
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 2, sigmaY: 3),
                                          child: Container(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12.0,
                                        top: 8.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'July 30',
                                              style: TextStyle(
                                                fontSize: 40.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 85.0,
                                            ),
                                            Text(
                                              'Let\'s Chat',
                                              style: TextStyle(
                                                fontSize: 50.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                'We have partnered with local licensed counselor Makesha Parrish',
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          });
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    List<Event> events = [];
    DateFormat fmt = DateFormat("yyyyMMdd");

    for (int i = 0; i < prevEvents.length; i++) {
      if (fmt.format(day).compareTo(
              fmt.format(DateTime.parse(prevEvents[i]["date_time"]))) ==
          0) {
        events.add(Event(title: prevEvents[i]["title"]));
      }
    }
    for (int i = 0; i < upcEvents.length; i++) {
      if (fmt.format(day).compareTo(
              fmt.format(DateTime.parse(upcEvents[i]["date_time"]))) ==
          0) {
        events.add(Event(title: upcEvents[i]["title"]));
      }
    }
    return events;
  }
}
