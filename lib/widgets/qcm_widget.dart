import 'package:fiches/models/qcm.dart';
import 'package:fiches/util/qcm_manager.dart';
import 'package:flutter/material.dart';

class QCMWidget extends StatefulWidget {
  QCMWidget({this.qcmManager, this.color});

  QCMManager qcmManager;
  Color color;

  @override
  State<StatefulWidget> createState() => QCMWidgetState();
}

class QCMWidgetState extends State<QCMWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    widgets.add(Container(
      padding: EdgeInsets.only(top: 32, bottom: 32,left: 8.0, right: 8.0),
      decoration: BoxDecoration(color: widget.color),
      child: Text(
        widget.qcmManager.qcms[widget.qcmManager.current].question,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ));

    widgets.add(Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            children: List.generate(widget.qcmManager.qcms[widget.qcmManager.current].suggestions.length, (index) {
              return Center(
                child: RaisedButton(
                  onPressed: () {
                    widget.qcmManager.validate(index);
                    widget.qcmManager.next(context);
                  },
                  color: widget.color,
                  textColor: Colors.white,
                  child: Text(widget.qcmManager.qcms[widget.qcmManager.current].suggestions[index]),
                ),
              );
            }))));

    widgets.add(FlatButton(
      onPressed: () {
        widget.qcmManager.skip();
        widget.qcmManager.next(context);
      },
      textColor: Colors.blue,
      child: Text(
        "Passer",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18.0),
      ),
    ));

    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets,
      ),
    );
  }
}
