import 'package:fiches/models/lesson.dart';
import 'package:fiches/screens/qcm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'notes_page.dart';

class LessonDetailsPage extends StatefulWidget {
  LessonDetailsPage({this.lesson});

  final Lesson lesson;

  @override
  State<StatefulWidget> createState() => LessonDetailsState();
}

class LessonDetailsState extends State<LessonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cours "),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "${widget.lesson.title}",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue),
              )),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text("${widget.lesson.summury}"),
          ),
          Container(
              margin: EdgeInsets.only(top: 8.0, left: 16.0),
              child: RaisedButton(
                child: Text("Lire les fiches"),
                padding: EdgeInsets.all(8.0),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (ctx) => NotePage(notes: widget.lesson.notes)));
                },
              )),
          Container(
            margin: EdgeInsets.only(top: 8.0, left: 16.0),
            child: RaisedButton(
              child: Text("Tester mes connaissances"),
              padding: EdgeInsets.all(8.0),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (ctx) => QCMPage(qcms: widget.lesson.qcms)));
              },
            ),
          )
        ],
      ),
    );
  }
}
