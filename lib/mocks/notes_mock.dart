import 'package:fiches/models/note.dart';

class NotesMockSciencesPhysique {
  List<Note> noteLeau = [
    Note(title: "L'eau", items: [
      NoteItemText(
          text:
              "L'eau est une molécule constitué de 2 atomes d' hydrogènes et 1 atomes d' oxygène."),
      NoteItemImage(url: "h2o.png"),
      NoteItemText(text: "La formule chimique de l'eau est H\u2082O"),
    ]),
    Note(title: "L'electrolyse de l'eau", items: [
      NoteItemText(
          text:
              "Quand on fait passer un courant dans une bassine d'eau, les molécules d'eau réagissent deux à deux pour former deux molécules d'hydrogène et une molécule de dioxygènes"),
      NoteItemText(text: "L'equation bilan de la réaction est:"),
      NoteItemText(text: "2H\u2082O \u2190 2H\u2082 + O\u2082"),
    ]),

    Note(title: "Test des row", items: [
      NoteItemRow(notesItems: [
        NoteItemText(text:"Un" ),
        NoteItemText(text: "Deux"),
        NoteItemText(text: "Trois"),
      ])
    ])
  ];

  List<Note> noteHydrocarbure = [];
}
