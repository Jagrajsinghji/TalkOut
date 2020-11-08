import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iosd/Screens/CommentsPage.dart';
import 'package:like_button/like_button.dart';

import 'PostComments.dart';

class TopicsPage extends StatefulWidget {
  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "TalkOut",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.info_outline),
              color: Colors.black,
              onPressed: () {
                Fluttertoast.showToast(msg: "Information");
              }),
          IconButton(
              icon: Image.asset("assets/bell.jpg"),
              onPressed: () {
                Fluttertoast.showToast(msg: "Notifications");
              }),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                child: Center(
                    child: Text(
                  "TalkOut",
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
          ],
        ),
      ),
      body: Theme(
        data: ThemeData(
          accentColor: Colors.pinkAccent,
        ),
        child: ListView.builder(
          itemBuilder: (c, i) => card(),
          itemCount: 4,
          shrinkWrap: true,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 2,initialIndex: 1 ,
          child: Transform.rotate(angle: pi,
            child: TabBar(
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.pink,
                tabs: [
                  Transform.rotate(angle: -pi,
                    child: Tab(
                      child: Row(
                        children: [
                          Expanded(flex: 0,
                            child: Image.asset(
                              "assets/handHeart.jpg",
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Expanded(flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left:5.0),
                              child: Text("Counselor\n"
                                  "Support"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Transform.rotate(angle: -pi,
                    child: Tab(
                      child: Row(
                        children: [
                          Expanded(flex: 0,
                            child: Image.asset(
                              "assets/group.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Expanded(flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left:5.0),
                              child: Text("Anonymous\n"
                                  "Community"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget card() {
    return Container(
        decoration: BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color:Colors.grey.shade300,width: 3.5))),
        child: ListView(shrinkWrap: true,primary: false,
          children: [
            ///Trending
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Trending",
                    style: TextStyle(fontSize: 24, color: Colors.pink),
                  )),
            ),
            /// Image with Text Overlay
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/calmBG.jpg",
                      fit: BoxFit.fill,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Let Out a thing of the past that bothers you",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            ///Like & Comment Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  size: 50,
                  circleColor:
                      CircleColor(start: Colors.redAccent, end: Colors.red),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.redAccent,
                    dotSecondaryColor: Colors.red,
                  ),
                  likeBuilder: (bool isLiked) {
                    return isLiked
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 33,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            size: 32,
                            color: Colors.black,
                          );
                  },
                  likeCount: 8,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? Colors.red : Colors.black;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "Like",
                        style: TextStyle(color: color, fontSize: 18),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(color: color, fontSize: 18),
                      );
                    return result;
                  },
                ),
                Container(
                  height: 50,
                  width: 70,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.insert_comment),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(opaque: false,
                                   pageBuilder: (a,b,c)=>PostComments()));
                          }),
                      Text(
                        "14",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                )
              ],
            ),
            /// Single Comment
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 18.0),
                  child: LayoutBuilder(builder: (context, size) {
                    var span = TextSpan(
                      text:
                          "To me, it's Robert Jordan's Wheel of Time. This is the epic fantasy series. It starts off wonderfully in The Eye of the World. It's clear that there are three protagonists, Rand, Perrin and Mat. And they have their female sidekicks, Moiraine, Egwene and Nynaeve. Plus, there's the swashbuckling, handsome and mysterious warrior-cum bodyguard Lan Mandragoran. How many important characters is that? Seven. Easy to handle? Sure. Normal novels have a minimum of seven important characters.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    );
                    var tp = TextPainter(
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      text: span,
                    );
                    tp.layout(maxWidth: size.maxWidth);
                    var exceeded = tp.didExceedMaxLines;

                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 10,top: 20),
                        child: Center(
                          child: Stack(children: <Widget>[
                            Text.rich(
                              span,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            if (exceeded)
                              Positioned(
                                  left: 60,
                                  bottom: 0,
                                  child: Container(
                                    width: MediaQuery.of(context)
                                            .size
                                            .width -
                                        50,
                                    color: Colors.grey.shade300,
                                    child: Row(
                                      children: [
                                        Text(
                                          "....",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Colors.black),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (c) =>
                                                        CommentPage()));
                                          },
                                          child: Text(
                                            "Continue Reading",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color:
                                                    Colors.pink),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                          ]),
                        ),
                      ),
                    );
                  }),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Transform.translate(
                    offset: Offset(0,15),
                    child: Text(
                      "3 d",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(left: 20,
                  child: Transform.translate( offset: Offset(0,-5),
                    child: Container(
                      width: 46,
                      height: 46,
                      child: Image.asset(
                        "assets/cat1.png",
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
            /// View All Comments Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => CommentPage()));
                  },
                  child: Text(
                    "View all 14 comments",
                    style: TextStyle(color: Colors.pink, fontSize: 20),
                  )),
            ),

          ],
        ));
  }

  // ListView.builder(
  // itemBuilder: (c, i) => card(),
  // itemCount: 4,
  // shrinkWrap: true,
  // ),
}
