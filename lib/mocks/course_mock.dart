
import 'package:fiches/mocks/lesson_mock.dart';
import 'package:fiches/models/course.dart';

class CourseMock {

  CourseMock(){
    lessonsMock = LessonMock();

    courses = <Course>[
      Course(name: "Sciences Physiques", lessons: lessonsMock.sciencesPhysiques),
      Course(name: "Mathématiques", lessons: lessonsMock.mathematique),
    ];
  }

  LessonMock lessonsMock;
  List<Course> courses;
}