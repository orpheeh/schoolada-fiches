import 'dart:math';

import 'package:fiches/models/qcm.dart';
import 'package:fiches/util/qcm_manager.dart';
import 'package:fiches/widgets/qcm_widget.dart';
import 'package:flutter/material.dart';

class QCMPage extends StatefulWidget {
  QCMPage({this.qcms});

  List<QCM> qcms;

  @override
  State<StatefulWidget> createState() => QCMPageState(qcms);
}

class QCMPageState extends State<QCMPage> {
  QCMPageState(List<QCM> qcms) {
    qcms.shuffle(Random());
    qcmManager = QCMManager(qcms: qcms.sublist(0, 5), state: this);
  }

  QCMManager qcmManager;
  var colors = [ Colors.yellow, Colors.red, Colors.green, Colors.blue, Colors.amber];

  @override
  Widget build(BuildContext context) {
    List<Widget> qcmWidgets = <Widget>[];

    for (int i = 0; i < qcmManager.qcms.length; i++) {
      qcmWidgets.add(
        Expanded(
            child: Container(
          height: 80,
          decoration: BoxDecoration(color: colors[i]),
              child: Center(child: qcmManager.results[i] == 0 ? Container() : Icon(qcmManager.results[i] == 1 ? Icons.check : qcmManager.results[i] == 2 ? Icons.clear : Icons.cancel),),
        )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("QCM"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: QCMWidget(qcmManager: qcmManager, color: colors[qcmManager.current]),
            ),
            Row(
              children: qcmWidgets
            )
          ],
        ),
      ),
    );
  }
}
