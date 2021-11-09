import 'package:flutter/material.dart';
import 'package:tst_app/home/home_screen.dart';
import 'package:tst_app/styles.dart';
import 'package:tst_app/home/page_components.dart';


class AllEvents extends StatelessWidget {
  static const route = 'all_events_screen';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<String> prevEvents = <String>['pEventOne', 'pEventTwo', 'pEventThree', 'pEventFour', 'pEventFive'];
    final List<String> upcEvents = <String>['uEventOne', 'uEventTwo', 'uEventThree', 'uEventFour', 'uEventFive'];
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appBackground,
        body: CustomScrollView(
            slivers: <Widget>[
              CustomAppBar(
                appbarColor: lightBrown,
                // use this as part of secondary color set (e.g. indigo)
                appbarTitle: 'All Events',
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 20.0, right: 20.0),
                        child: ExpansionTile(
                          iconColor: lightPurple,
                          collapsedIconColor: darkPurple,
                          title: const Text(
                            'Upcoming Events',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: defaultTextColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: upcEvents.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(upcEvents[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                            Text("Event Date")
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () => showDialog(
                                            context: context,
                                            builder: (BuildContext dialogContext) {
                                              return Dialog(
                                                backgroundColor: appBackground,
                                                child: Container(
                                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                                                  height: 450,
                                                  decoration: const BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topCenter,
                                                          end: Alignment.bottomCenter,
                                                          colors:  [lightBrown, appBackground],
                                                          stops: [0.4, 0.4]
                                                      )
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.topRight,
                                                         child:GestureDetector(
                                                          onTap: () => Navigator.pop(context),
                                                          child: Icon(Icons.close, color: darkPurple),
                                                        ),
                                                      ),
                                                      SizedBox(height: 120),
                                                      Text("January 1st", style: TextStyle(color: lightTextColor, fontSize: 20)),
                                                      SizedBox(height: 10),
                                                      Text(upcEvents[index], style: TextStyle(fontSize: 25, color: defaultTextColor)),
                                                      Text("Location", style: TextStyle(fontSize: 15, color: defaultTextColor)),
                                                      SizedBox(height: 2),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children:[
                                                        Text("hosted by Teachers Support Teachers", style: TextStyle(fontSize: 12, color: defaultTextColor)),
                                                        Text("time", style: TextStyle(fontSize: 12))
                                                        ]
                                                      ),
                                                      SizedBox(height: 20),
                                                      Text("Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut", style: TextStyle(fontSize: 19, color: defaultTextColor))
                                                    ],
                                                  )
                                                )
                                              );
                                            },
                                          ),
                                          child:
                                          const Icon(Icons.arrow_forward_ios,
                                            color: darkPurple, size: 18.0)
                                        )
                                      ],
                                    ),
                                  );
                                }
                            ),
                          ]
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 20.0, right: 20.0),
                        child: ExpansionTile(
                            iconColor: lightPurple,
                            collapsedIconColor: darkPurple,
                            title: const Text(
                              'Previous Events',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: defaultTextColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            children: [
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: prevEvents.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(prevEvents[index], textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                              Text("Event Date")
                                            ],
                                          ),
                                          GestureDetector(
                                              onTap: () => showDialog(
                                                context: context,
                                                builder: (BuildContext dialogContext) {
                                                  return Dialog(
                                                      backgroundColor: appBackground,
                                                      child: Container(
                                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                                                          height: 450,
                                                          decoration: const BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  begin: Alignment.topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors:  [lightBrown, appBackground],
                                                                  stops: [0.4, 0.4]
                                                              )
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Align(
                                                                alignment: Alignment.topRight,
                                                                child:GestureDetector(
                                                                  onTap: () => Navigator.pop(context),
                                                                  child: Icon(Icons.close, color: darkPurple),
                                                                ),
                                                              ),
                                                              SizedBox(height: 120),
                                                              Text("January 1st", style: TextStyle(color: lightTextColor, fontSize: 20)),
                                                              SizedBox(height: 10),
                                                              Text(prevEvents[index], style: TextStyle(fontSize: 25, color: defaultTextColor)),
                                                              Text("Location", style: TextStyle(fontSize: 15, color: defaultTextColor)),
                                                              SizedBox(height: 2),
                                                              Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children:[
                                                                    Text("hosted by Teachers Support Teachers", style: TextStyle(fontSize: 12, color: defaultTextColor)),
                                                                    Text("time", style: TextStyle(fontSize: 12))
                                                                  ]
                                                              ),
                                                              SizedBox(height: 20),
                                                              Text("Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut", style: TextStyle(fontSize: 19, color: defaultTextColor))
                                                            ],
                                                          )
                                                      )
                                                  );
                                                },
                                              ),
                                              child:
                                              const Icon(Icons.arrow_forward_ios,
                                                  color: darkPurple, size: 18.0)
                                          )
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
              ),
          ],
        ),
    );
  }
}
