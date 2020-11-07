import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';

import 'ThreadScreen.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(accentColor: Colors.pink),
              child: ListView(
                children: [
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Let Out a thing of the past that bothers you",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            LikeButton(
                              size: 50,
                              circleColor: CircleColor(
                                  start: Colors.redAccent, end: Colors.red),
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
                                        color: Colors.white,
                                      );
                              },
                              likeCount: 8,
                              countBuilder: (int count, bool isLiked, String text) {
                                var color = isLiked ? Colors.red : Colors.white;
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
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_outlined),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.white,
                            ),
                            IconButton(
                              icon: Icon(Icons.notifications_active_outlined),
                              onPressed: () {
                                Fluttertoast.showToast(msg: "Notifications");
                              },
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: "Top");
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Chip(
                                label: Padding(
                                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                                  child: Text("Top"),
                                ),
                                backgroundColor: Colors.grey.shade300,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: "New");
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Chip(
                                label: Padding(
                                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                                  child: Text("New"),
                                ),
                                backgroundColor: Colors.pink,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: "My");
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Chip(
                                label: Padding(
                                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                                  child: Text("My"),
                                ),
                                backgroundColor: Colors.grey.shade300,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: "Counselor");
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Chip(
                                label: Padding(
                                  padding: const EdgeInsets.only(left: 5.0, right: 5),
                                  child: Text("Counselor"),
                                ),
                                backgroundColor: Colors.grey.shade300,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ///type 1 comment
                        Container(color: Colors.white,
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0, top: 10),
                                child: Container(
                                  width: 46,
                                  height: 46,
                                  child:  Image.asset(
                                    "assets/cat2.png",
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "The things that bother me are that being bullied for my body in my childhood",
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 5,
                                            child: Transform.translate(
                                              offset: Offset(10, 10),
                                              child: Container(
                                                height: 20,
                                                width: 60,
                                                decoration: BoxDecoration(boxShadow: [
                                                  BoxShadow(color: Colors.black,blurRadius: 1,spreadRadius: .5)
                                                ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(12)),
                                                child:          LikeButton(
                                                  size:20,
                                                  circleColor: CircleColor(
                                                      start: Colors.redAccent, end: Colors.red),
                                                  bubblesColor: BubblesColor(
                                                    dotPrimaryColor: Colors.redAccent,
                                                    dotSecondaryColor: Colors.red,
                                                  ),
                                                  likeBuilder: (bool isLiked) {
                                                    return Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red,size: 20,
                                                    );
                                                  },
                                                  likeCount: 0,
                                                  countBuilder: (int count, bool isLiked, String text) {
                                                    Widget result;
                                                    if (count == 0) {
                                                      result = Text(
                                                        "Like",
                                                        style: TextStyle(color: Colors.black, fontSize: 14  ),
                                                      );
                                                    } else
                                                      result = Text(
                                                        text,
                                                        style: TextStyle(color: Colors.black, fontSize: 14),
                                                      );
                                                    return result;
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "3d",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(left:15.0,),
                                        child: Container(height: 40,
                                          child: TextField(decoration: InputDecoration(hintText: "Write a reply....",contentPadding: EdgeInsets.only(left: 10),
                                          hintStyle: TextStyle(fontSize: 14,color: Colors.grey,),
                                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
                                          focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.pink))),),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),





                        /// type 2 comment
                        Container(color: Colors.white,
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0, top: 10),
                                child: Container(
                                  width: 46,
                                  height: 46,
                                  child: Image.asset(
                                    "assets/cat2.png",
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                "To me, it's Robert Jordan's Wheel of Time. This is the epic fantasy series. It starts off wonderfully in The Eye of the World. It's clear that there are three protagonists, Rand, Perrin and Mat. And they have their female sidekicks, Moiraine, Egwene and Nynaeve. Plus, there's the swashbuckling, handsome and mysterious warrior-cum bodyguard Lan Mandragoran. How many important characters is that? Seven. Easy to handle? Sure. Normal novels have a minimum of seven important characters.",
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 5,
                                            child: Transform.translate(
                                              offset: Offset(10, 10),
                                              child: Container(
                                                height: 20,
                                                width: 60,
                                                decoration: BoxDecoration(boxShadow: [
                                                  BoxShadow(color: Colors.black,blurRadius: 1,spreadRadius: .5)
                                                ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(12)),
                                                child:          LikeButton(
                                                  size:20,
                                                  circleColor: CircleColor(
                                                      start: Colors.redAccent, end: Colors.red),
                                                  bubblesColor: BubblesColor(
                                                    dotPrimaryColor: Colors.redAccent,
                                                    dotSecondaryColor: Colors.red,
                                                  ),
                                                  likeBuilder: (bool isLiked) {
                                                    return Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red,size: 20,
                                                    );
                                                  },
                                                  likeCount: 1,
                                                  countBuilder: (int count, bool isLiked, String text) {
                                                    Widget result;
                                                    if (count == 0) {
                                                      result = Text(
                                                        "Like",
                                                        style: TextStyle(color: Colors.black, fontSize: 14  ),
                                                      );
                                                    } else
                                                      result = Text(
                                                        text,
                                                        style: TextStyle(color: Colors.black, fontSize: 14),
                                                      );
                                                    return result;
                                                  },
                                                ),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "3d",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )),
                                      Align(alignment: Alignment.centerLeft,
                                        child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (c)=>ThreadScreen()));},
                                            child: Text(
                                              "View all 4 replies",
                                              style: TextStyle(color: Colors.pink, fontSize: 16),
                                            )),
                                      ),



                                      /// replies
                                      Container(color: Colors.white,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 46,
                                              height: 46,
                                              child: Image.asset(
                                                "assets/cat2.png",
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(color: Colors.black),
                                                  shape: BoxShape.circle),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(left:10,),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey.shade300,
                                                              borderRadius:
                                                              BorderRadius.circular(12)),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(10.0),
                                                            child: Text(
                                                              "The things that bother me are that being bullied for my body in my childhood",
                                                              softWrap: true,
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          right: 5,
                                                          child: Transform.translate(
                                                            offset: Offset(10, 10),
                                                            child: Container(
                                                              height: 20,
                                                              width: 60,
                                                              decoration: BoxDecoration(boxShadow: [
                                                                BoxShadow(color: Colors.black,blurRadius: 1,spreadRadius: .5)
                                                              ],
                                                                  color: Colors.white,
                                                                  borderRadius:
                                                                  BorderRadius.circular(12)),
                                                              child:          LikeButton(
                                                                size:20,
                                                                circleColor: CircleColor(
                                                                    start: Colors.redAccent, end: Colors.red),
                                                                bubblesColor: BubblesColor(
                                                                  dotPrimaryColor: Colors.redAccent,
                                                                  dotSecondaryColor: Colors.red,
                                                                ),
                                                                likeBuilder: (bool isLiked) {
                                                                  return Icon(
                                                                    Icons.favorite_border,
                                                                    color: Colors.red,size: 20,
                                                                  );
                                                                },
                                                                likeCount: 0,
                                                                countBuilder: (int count, bool isLiked, String text) {
                                                                  Widget result;
                                                                  if (count == 0) {
                                                                    result = Text(
                                                                      "Like",
                                                                      style: TextStyle(color: Colors.black, fontSize: 14  ),
                                                                    );
                                                                  } else
                                                                    result = Text(
                                                                      text,
                                                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                                                    );
                                                                  return result;
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Align(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Text(
                                                          "3d",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:15.0,),
                                                      child: Container(height: 40,
                                                        child: TextField(decoration: InputDecoration(hintText: "Write a reply....",contentPadding: EdgeInsets.only(left: 10),
                                                            hintStyle: TextStyle(fontSize: 14,color: Colors.grey,),
                                                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
                                                            focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.pink))),),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                Border(top: BorderSide(color: Colors.grey, width: 2))),
            child: Padding(
              padding: const EdgeInsets.only(left:20.0,bottom: 10,right: 10,top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write a Comment....",
                          contentPadding: EdgeInsets.only(
                            left: 10,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.pink))),
                    ),
                  ),
                  Expanded(flex: 0,child: IconButton(icon: Icon(Icons.send), onPressed: (){Fluttertoast.showToast(msg:"Posting");}))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
