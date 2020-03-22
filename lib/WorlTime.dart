import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';



class WorldTime  {

  String location;
  String time;
  String flag;
  String url;
  bool isDayTime = false;


  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime()async{
    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);


      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));


      isDayTime = now.hour > 6 && now.hour < 15 ? true : false;
      time = DateFormat.jm().format(now);
      print('The time now is '+time);

    }catch(e){

      print('Error '+e);
      time = 'Could not get date';
    }
  }
}

