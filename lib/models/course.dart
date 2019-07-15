import 'package:fiches/mocks/course_mock.dart';

import 'lesson.dart';

class Course {
  Course({this.name, this.lessons});

  String name;
  List<Lesson> lessons;
  List<Lesson> readingLessons = <Lesson>[];
  List<Lesson> readFinishLesson = <Lesson>[];

  List<Lesson> getLessonList(Lesson l) {
    if (lessons.contains(l)) {
      return lessons;
    } else if (readFinishLesson.contains(l)) {
      return readFinishLesson;
    }
    return readingLessons;
  }

  moveToReading(Lesson l) {
    getLessonList(l).remove(l);
    readingLessons.add(l);
  }

  moveToLesson(Lesson l) {
    getLessonList(l).remove(l);
    lessons.add(l);
  }

  moveToReadfinish(Lesson l) {
    getLessonList(l).remove(l);
    readFinishLesson.add(l);
  }
}

class CourseList {
  List<Course> courses;

  CourseList() {
    courses = CourseMock().courses;
  }
}
