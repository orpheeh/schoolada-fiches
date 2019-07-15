
import 'package:fiches/models/note.dart';
import 'package:fiches/widgets/notes_widget.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {

  NotePage({this.notes});

  List<Note> notes;

  @override
  State<StatefulWidget> createState() => NotePageState();
}

class NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fiches de lecture"),),
      body: NoteWidget(notes: widget.notes),
    );
  }
}