import 'package:flutter/material.dart';
import 'package:practiceflutter/ChooseLocation.dart';
import 'package:practiceflutter/Loading.dart';
import 'Home.dart';


void main() => runApp(MaterialApp(

  debugShowCheckedModeBanner: false,

 initialRoute: '/',

 routes: {

   '/': (context)=>Loading(),
   '/Home': (context)=> Home(),
   '/ChooseLocation': (context)=>ChooseLocation(),

 },

));

