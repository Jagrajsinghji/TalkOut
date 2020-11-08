import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostComments extends StatefulWidget {
  @override
  _PostCommentsState createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 100,
              child: TextField(onChanged: (s)=>setState((){comment=s;}),
                autofocus: true,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    suffixIcon: FlatButton(
                        disabledTextColor: Colors.grey,
                        textColor: Colors.black,
                        onPressed: comment == null || comment.length == 0
                            ? null
                            : () {
                                Fluttertoast.showToast(msg: "Posting Comment");
                                Navigator.pop(context);
                              },
                        child: Text(
                          "Post",
                          style: TextStyle(fontSize: 16),
                        )),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.pink)),
                    hintText: "Write a comment....",
                    hintStyle: TextStyle(fontSize: 14)),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
