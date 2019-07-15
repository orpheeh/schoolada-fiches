
import 'package:fiches/models/qcm.dart';
import 'package:fiches/screens/qcm_page.dart';
import 'package:flutter/material.dart';

class QCMManager {

  QCMManager({this.qcms, this.state}){
    results = List<int>.generate(this.qcms.length, (i) => 0);
    current = 0;
  }

  //0 vide
  //1 bonne réponse
  //2 mauvaise réponse
  //3 passer

  List<QCM> qcms;
  List<int> results;
  QCMPageState state;
  int current;

  void next(BuildContext context){
    state.setState((){
      current++;
      if(current >= results.length){
        current = 0;
        Navigator.pop(context);
      }
    });
  }

  void skip(){
    results[current] = 3;
  }

  void validate(int response){
    if(response == qcms[current].response){
      results[current] = 1;
    } else {
      results[current] = 2;
    }
  }
}