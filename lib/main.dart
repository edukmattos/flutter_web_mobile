import 'package:flutter/material.dart';
import 'package:flutter_web_mobile/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
//import 'package:firebase/firebase.dart' as fb;
//import 'package:firebase/firebase.dart';

void main() {

  //if (fb.apps.isEmpty) {
  //  initializeApp(
  //    apiKey: "AIzaSyAAkKY9dkFVD37ZL6Q61Zg4tb0ei9fwBik",
  //    authDomain: "fir-6032e.firebaseapp.com",
  //    databaseURL: "https://fir-6032e.firebaseio.com",
  //    projectId: "fir-6032e",
  //    storageBucket: "fir-6032e.appspot.com",
  //    messagingSenderId: "496616678276"
  //  );
  //}
  
  runApp(ModularApp(module: AppModule()));
}
