
import 'package:fiches/models/qcm.dart';

import 'note.dart';

class Lesson {

  Lesson({this.title, this.summury, this.notes = const <Note>[], this.qcms = const <QCM>[] });

  final String title;
  final String summury;
  final List<Note> notes;
  final List<QCM> qcms;

}

