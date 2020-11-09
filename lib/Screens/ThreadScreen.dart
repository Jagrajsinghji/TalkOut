import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';

class ThreadScreen extends StatefulWidget {
  final String commentID;

  const ThreadScreen({Key key, @required this.commentID}) : super(key: key);

  @override
  _ThreadScreenState createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  String _reply;
  TextEditingController _replyController = TextEditingController();
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
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Posts")
                      .doc("kbgXIibwPjF0ksC6ch8i")
                      .collection("Comments")
                      .doc(widget.commentID)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot?.data?.data() != null) {
                      Map data = snapshot.data.data();
                      List replies = data['replies'] ?? [];
                      int time = 2;
                      String timesuffix = "sec";
                      Timestamp timestamp = data['timeStamp'];
                      time = DateTime.now()
                              .difference(timestamp.toDate())
                              .inSeconds +
                          1;

                      if (time > 60) {
                        timesuffix = "min";
                        time = DateTime.now()
                            .difference(timestamp.toDate())
                            .inMinutes;
                        if (time > 60) {
                          timesuffix = "hrs";
                          time = DateTime.now()
                              .difference(timestamp.toDate())
                              .inHours;
                          if (time > 24) {
                            timesuffix = "days";
                            time = DateTime.now()
                                .difference(timestamp.toDate())
                                .inDays;
                            if (time >= 7) {
                              timesuffix = "weeks";
                              time = time ~/ 7;
                              if (time == 1) timesuffix = "week";
                            }
                          }
                        }
                      }
                      return ListView(
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
                                  "assets/cat0.png",
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
                              data['comment'],
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
                                countBuilder:
                                    (int count, bool isLiked, String text) {
                                  var color =
                                      isLiked ? Colors.red : Colors.black;
                                  Widget result;
                                  if (count == 0) {
                                    result = Text(
                                      "Like",
                                      style:
                                          TextStyle(color: color, fontSize: 18),
                                    );
                                  } else
                                    result = Text(
                                      text,
                                      style:
                                          TextStyle(color: color, fontSize: 18),
                                    );
                                  return result;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  "$time $timesuffix",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 4,
                            color: Colors.grey.shade300,
                          ),

                          /// replies
                          ...replies.map((replyData) {
                            int time = 2;
                            String timesuffix = "sec";
                            Timestamp timestamp = replyData['timeStamp'];
                            time = DateTime.now()
                                    .difference(timestamp.toDate())
                                    .inSeconds +
                                1;
                            if (time > 60) {
                              timesuffix = "min";
                              time = DateTime.now()
                                  .difference(timestamp.toDate())
                                  .inMinutes;
                              if (time > 60) {
                                timesuffix = "hrs";
                                time = DateTime.now()
                                    .difference(timestamp.toDate())
                                    .inHours;
                                if (time > 24) {
                                  timesuffix = "days";
                                  time = DateTime.now()
                                      .difference(timestamp.toDate())
                                      .inDays;
                                  if (time >= 7) {
                                    timesuffix = "weeks";
                                    time = time ~/ 7;
                                    if (time == 1) timesuffix = "week";
                                  }
                                }
                              }
                            }

                            return   Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22.0, top: 10),
                                    child: Container(
                                      width: 46,
                                      height: 46,
                                      child: Image.asset(
                                        "assets/cat${replies.indexOf(replyData) % 2}.png",
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
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12)),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: Align(alignment: Alignment.centerLeft,
                                                    child: Text(
                                                     replyData['reply'],
                                                      softWrap: true,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                    ),
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
                                                        BorderRadius.circular(
                                                            12)),
                                                    child: LikeButton(
                                                      size: 20,
                                                      circleColor: CircleColor(
                                                          start: Colors.redAccent,
                                                          end: Colors.red),
                                                      bubblesColor: BubblesColor(
                                                        dotPrimaryColor:
                                                        Colors.redAccent,
                                                        dotSecondaryColor:
                                                        Colors.red,
                                                      ),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.red,
                                                          size: 20,
                                                        );
                                                      },
                                                      likeCount: 0,
                                                      countBuilder: (int count,
                                                          bool isLiked,
                                                          String text) {
                                                        Widget result;
                                                        if (count == 0) {
                                                          result = Text(
                                                            "Like",
                                                            style: TextStyle(
                                                                color:
                                                                Colors.black,
                                                                fontSize: 14),
                                                          );
                                                        } else
                                                          result = Text(
                                                            text,
                                                            style: TextStyle(
                                                                color:
                                                                Colors.black,
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
                                              Text(
                                                "$time $timesuffix",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0),
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
                            );
                          }).toList(),

                        ],
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.pink),
                    ));
                  }),
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
                    child: TextField(controller: _replyController,
                      onChanged: (s)=>setState((){_reply=s;}),
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
                          onPressed: _reply == null || _reply.trim().length == 0
                              ? null
                              : () {
                            _replyController.clear();
                            FocusScope.of(context)
                                .requestFocus(FocusNode());
                            FirebaseFirestore
                                .instance
                                .collection(
                                "Posts")
                                .doc(
                                "kbgXIibwPjF0ksC6ch8i")
                                .collection(
                                "Comments")
                                .doc(widget.commentID)
                                .set(
                                {
                                  "replies":
                                  FieldValue
                                      .arrayUnion([
                                    {
                                      "reply": _reply
                                          .trim(),
                                      "timeStamp":
                                      DateTime
                                          .now()
                                    }
                                  ]),
                                },
                                SetOptions(
                                    merge:
                                    true));
                            Fluttertoast.showToast(
                                msg:
                                "Reply Posted");
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
