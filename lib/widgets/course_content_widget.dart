import 'package:fiches/models/lesson.dart';
import 'package:fiches/models/course.dart';
import 'package:fiches/screens/lesson_details_page.dart';
import 'package:flutter/material.dart';

class CourseContentWidget extends StatefulWidget {
  CourseContentWidget({this.course});

  final Course course;

  @override
  State<CourseContentWidget> createState() => CourseContentState();
}

class CourseContentState extends State<CourseContentWidget> {
  _lessonCard(Lesson lesson) {
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LessonDetailsPage(lesson: lesson,)));
        },
        child: Card(
            elevation: 4.0,
            child: Container(
              width: 180.0,
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        lesson.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        lesson.summury,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            )));
  }

  _listWidget(List<Lesson> lessons) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        Widget card = _lessonCard(lessons[index]);
        return Draggable<Lesson>(
            data: lessons[index],
            child: Container( child: card, padding: EdgeInsets.symmetric(horizontal: 16.0),),
            childWhenDragging: Container(),
            feedback: card);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 16.0, left: 8.0),
          child: Text(
            'A lire',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(color: Colors.blue[50]),
            child: DragTarget<Lesson>(
              builder: (context, List<Lesson> acceptData, rejectedData) {
                return _listWidget(widget.course.lessons);
              },
              onWillAccept: (data) => true,
              onAccept: (data) {
                setState(() {
                  widget.course.moveToLesson(data);
                });
              },
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 16.0, left: 8.0),
            child: Text(
              'En cour de lecture',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(color: Colors.blue[100]),
            child: DragTarget<Lesson>(
              builder: (context, List<Lesson> acceptData, rejectedData) {
                return _listWidget(widget.course.readingLessons);
              },
              onWillAccept: (data) => true,
              onAccept: (data) {
                setState(() {
                  widget.course.moveToReading(data);
                });
              },
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 16.0, left: 8.0),
            child: Text(
              'Lu',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(color: Colors.blue[200]),
            child: DragTarget<Lesson>(
              builder: (context, List<Lesson> acceptData, rejectedData) {
                return _listWidget(widget.course.readFinishLesson);
              },
              onWillAccept: (data) => true,
              onAccept: (data) {
                setState(() {
                  widget.course.moveToReadfinish(data);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
