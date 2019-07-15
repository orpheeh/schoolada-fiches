import 'package:fiches/models/note.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatefulWidget {
  NoteWidget({this.notes});

  List<Note> notes;

  @override
  State<NoteWidget> createState() => NoteWidgetState();
}

class NoteWidgetState extends State<NoteWidget> {
  _noteDragView(Note note, Color color, Color textColor) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(color: color),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                note.title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: textColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  _noteView(Note note, Color color, Color textColor) {
    List<Widget> contents = <Widget>[
      Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            note.title,
            style: TextStyle(
                fontSize: 18.0, color: textColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
    ];

    note.items.forEach((item) {
      if (item is NoteItemText) {
        contents.add(_noteItemText(item.text, textColor));
      } else if(item is NoteItemImage) {
        contents.add(_noteItemImage(item.url));
      } else if(item is NoteItemRow) {
        contents.add(_noteItemRow(item.notesItems, textColor));
      }
    });
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: contents),
    );
  }

  _noteItemText(text, Color textColor){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16.0),
      ),
    );
  }

  _noteItemImage(url) {
    return Container(
      child: Image.asset('assets/' + url),
    );
  }

  _noteItemRow(List<NoteItem> items, Color color){
    List<Widget> widgets = <Widget>[];
    items.forEach((item){
      if(item is NoteItemText){
        widgets.add(_noteItemText(item.text, color));
      } else if(item is NoteItemImage){
        widgets.add(_noteItemImage(item.url));
      } else if(item is NoteItemRow){
        widgets.add(_noteItemRow(item.notesItems, color));
      }
    });

    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgets,)
    );
  }

  void rotateNotes(List<Note> notes) {
    Note firstNote = notes[0];
    notes.removeAt(0);
    notes.add(firstNote);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> notesWidget = <Widget>[];

    for (int i = widget.notes.length - 1; i >= 0; i--) {
      Color color = Colors.blue[200 * (i + 1)];
      double yOffset = 0.0;
      if (i == 0) {
        color = Colors.blue[50];
        yOffset = 10.0;
      }
      notesWidget.add(Transform.translate(
          offset: Offset(0.0, 10.0 / (i + 1)),
          child: Draggable(
            child: _noteView(widget.notes[i], color, Colors.black),
            feedback: _noteDragView(widget.notes[i], color, Colors.black),
            childWhenDragging: Container(),
            onDraggableCanceled: (Velocity velocity, offset) {
              if (velocity.pixelsPerSecond.distance > 100.0) {
                setState(() {
                  rotateNotes(widget.notes);
                });
              }
            },
          )));
    }
    ;

    return Center(
        child: Container(
      margin: EdgeInsets.all(16.0),
      child: Stack(
        children: notesWidget,
      ),
    ));
  }
}
