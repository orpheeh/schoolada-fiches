import 'package:fiches/mocks/qcm_mock.dart';
import 'package:fiches/models/lesson.dart';

import 'notes_mock.dart';

class LessonMock {
  //Sciences physique
  List<Lesson> sciencesPhysiques = [
    Lesson(
        title: "L'eau",
        notes: NotesMockSciencesPhysique().noteLeau,
        qcms: QCMSciencesPhysiqueMock().qcmEau,
        summury:
            "L'eau est une molécule qui peut être sous plusieurs forme: solide , liquide ou gazeux"),
    Lesson(
        title: 'Les hydrocarbures',
        notes: NotesMockSciencesPhysique().noteHydrocarbure,
        summury:
            "Les hydrocarbures sont des molécules constitué uniquement de carbone et d'hydrogène. On les retrouves beaucoup dans le pétrol"),
    Lesson(
        title: "Poids et masse",
        summury:
            "Le poids est une force que la terre exerce sur les corps qui sont proches d'elle. Vue que la terre est ronde, c'est grâce à cette force que on toujours les pieds sur terre."),
    Lesson(
        title: "La poussé d'archimède",
        summury:
            "La poussé d'archimède est une force que excerce les liquides sur les objets qui s'y trouve"),
    Lesson(
        title: "Action du dioxigène sur les corps simple",
        summury: "Le dioxygène contenu dans l'air transforme le fer en rouille mais pas que. C'est ce que nous verrons dans ce cours"
    )
  ];


  List<Lesson> mathematique = <Lesson>[
    Lesson(
      title: "Propriété de Thales",
      summury: "Les droites parallèles"
    ),

    Lesson(
      title: "Triangle rectangle",
      summury: "Propriété de pythagore"
    ),

    Lesson(
      title: "Trigonométrie",
      summury: "Les fonctions cosinus, sinus et tangente"
    ),

    Lesson(
      title: "Vecteurs",
      summury: "Un object qui indique des directions dans le plan ou l'espace"
    ),

    Lesson(
      title: "Calcul Lattéral",
      summury: "Comment faire des opération complexes"
    ),

    Lesson(
      title: "Racine carrées",
      summury: "Devinette: Quel est le nombre multiplié par lui même donne 4 ? réponse: la racine carré de 4"
    ),

    Lesson(
      title: "Statistique",
      summury: "Etudier les caractères dans une population"
    )

  ];
}
