import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';

class ThreadScreen extends StatefulWidget {
  @override
  _ThreadScreenState createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Thread",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(accentColor: Colors.pink),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "To me, it's Robert Jordan's Wheel of Time. This is the epic fantasy series. It starts off wonderfully in The Eye of the World. It's clear that there are three protagonists, Rand, Perrin and Mat. And they have their female sidekicks, Moiraine, Egwene and Nynaeve. Plus, there's the swashbuckling, handsome and mysterious warrior-cum bodyguard Lan Mandragoran. How many important characters is that? Seven. Easy to handle? Sure. Normal novels have a minimum of seven important characters.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LikeButton(
                        size: 50,
                        padding: EdgeInsets.zero,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  color: Colors.red,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "3d",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 4,
                    color: Colors.grey.shade300,
                  ),

                  /// replies
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0, top: 10),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
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
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 1,
                                                    spreadRadius: .5)
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: LikeButton(
                                            size: 20,
                                            circleColor: CircleColor(
                                                start: Colors.redAccent,
                                                end: Colors.red),
                                            bubblesColor: BubblesColor(
                                              dotPrimaryColor: Colors.redAccent,
                                              dotSecondaryColor: Colors.red,
                                            ),
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                                size: 20,
                                              );
                                            },
                                            likeCount: 0,
                                            countBuilder: (int count,
                                                bool isLiked, String text) {
                                              Widget result;
                                              if (count == 0) {
                                                result = Text(
                                                  "Like",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              } else
                                                result = Text(
                                                  text,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              return result;
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "3d",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.reply,
                                        color: Colors.grey.shade600,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0, top: 10),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
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
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 1,
                                                    spreadRadius: .5)
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: LikeButton(
                                            size: 20,
                                            circleColor: CircleColor(
                                                start: Colors.redAccent,
                                                end: Colors.red),
                                            bubblesColor: BubblesColor(
                                              dotPrimaryColor: Colors.redAccent,
                                              dotSecondaryColor: Colors.red,
                                            ),
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                                size: 20,
                                              );
                                            },
                                            likeCount: 0,
                                            countBuilder: (int count,
                                                bool isLiked, String text) {
                                              Widget result;
                                              if (count == 0) {
                                                result = Text(
                                                  "Like",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              } else
                                                result = Text(
                                                  text,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              return result;
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "3d",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.reply,
                                        color: Colors.grey.shade600,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                            padding: const EdgeInsets.all(10),
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
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 1,
                                                    spreadRadius: .5)
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: LikeButton(
                                            size: 20,
                                            circleColor: CircleColor(
                                                start: Colors.redAccent,
                                                end: Colors.red),
                                            bubblesColor: BubblesColor(
                                              dotPrimaryColor: Colors.redAccent,
                                              dotSecondaryColor: Colors.red,
                                            ),
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                                size: 20,
                                              );
                                            },
                                            likeCount: 0,
                                            countBuilder: (int count,
                                                bool isLiked, String text) {
                                              Widget result;
                                              if (count == 0) {
                                                result = Text(
                                                  "Like",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              } else
                                                result = Text(
                                                  text,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              return result;
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "3d",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.reply,
                                        color: Colors.grey.shade600,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0, top: 10),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
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
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 1,
                                                    spreadRadius: .5)
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: LikeButton(
                                            size: 20,
                                            circleColor: CircleColor(
                                                start: Colors.redAccent,
                                                end: Colors.red),
                                            bubblesColor: BubblesColor(
                                              dotPrimaryColor: Colors.redAccent,
                                              dotSecondaryColor: Colors.red,
                                            ),
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                                size: 20,
                                              );
                                            },
                                            likeCount: 0,
                                            countBuilder: (int count,
                                                bool isLiked, String text) {
                                              Widget result;
                                              if (count == 0) {
                                                result = Text(
                                                  "Like",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              } else
                                                result = Text(
                                                  text,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                );
                                              return result;
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "3d",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Icon(
                                        Icons.reply,
                                        color: Colors.grey.shade600,
                                        size: 16,
                                      ),
                                    )
                                  ],
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
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey, width: 2))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, bottom: 10, right: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write a reply....",
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
                  Expanded(
                      flex: 0,
                      child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Posting");
                          }))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
