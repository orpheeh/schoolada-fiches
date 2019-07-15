
import 'package:fiches/models/course.dart';
import 'package:fiches/widgets/course_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoursePage extends StatefulWidget {
    CoursePage({this.course});

    final Course course;

    @override
    State<CoursePage> createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.course.name}"),),
      body: CourseContentWidget(course: widget.course,),
    );
  }

}