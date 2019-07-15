import 'package:fiches/models/course.dart';
import 'package:fiches/screens/course_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage() : courseList = CourseList();

  final CourseList courseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des matières'),
        ),
        body: ListView.builder(
          itemCount: courseList.courses.length,
          itemBuilder: (ctx, index) {
            return ListTile(
                title: Text(courseList.courses[index].name,
                    style: TextStyle(fontSize: 16.0, color: Colors.black)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => CoursePage(
                                course: courseList.courses[index],
                              )));
                });
          },
        ));
  }
}
