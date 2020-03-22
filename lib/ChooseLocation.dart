import 'package:flutter/material.dart';
import 'package:practiceflutter/WorlTime.dart';
import 'WorlTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime>  countries = [

    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: '/Abidjan.gif'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: '/accra.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: '/Algiers.png'),
    WorldTime(url: 'Africa/Bissau', location: 'Bissau', flag: '/Bissau.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: '/Cairo.png'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: '/Casablanca.gif'),
    WorldTime(url: 'Africa/Ceuta', location: 'Ceuta', flag: '/Ceuta.png'),
    WorldTime(url: 'Africa/El_Aaiun', location: 'El_Aaiun', flag: '/El_Aaiun.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: '/Africa.jpg'),
    WorldTime(url: 'Africa/Juba', location: 'Juba', flag: '/Juba.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: '/Lagos.png'),
    WorldTime(url: 'Africa/Maputo', location: 'Maputo', flag: '/Maputo.gif'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: '/Nairobi.png'),
    WorldTime(url: 'America/Argentina/Jujuy', location: 'Jujuy', flag: '/Jujuy.png'),
    WorldTime(url: 'America/Argentina/Tucuman', location: 'Tucuman', flag: '/Tucuman.png'),
    WorldTime(url: 'America/Atikokan', location: 'Atikokan', flag: '/Atikokan.png'),
    WorldTime(url: 'Asia/Macau', location: 'Macau', flag: '/Macau.png'),
    WorldTime(url: 'Asia/Magadan', location: 'Magadan', flag: '/Magadan.png'),
    WorldTime(url: 'Australia/Perth', location: 'Perth', flag: '/Perth.png'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: '/Melbourne.png'),
    WorldTime(url: 'Australia/Lindeman', location: 'Lindeman', flag: '/Lindeman.png'),


  ];


  void updateTime(index)async{

    WorldTime instance = countries[index];
    await instance.getTime();

    Navigator.pop(context, {

      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),

      body: ListView.builder(

        itemCount: countries.length,
        itemBuilder: (context, index){

          return Card(

            child: ListTile(

              onTap: (){
                updateTime(index);
              },

              title: Text(
                  countries[index].location,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0
                  ),
              ),

              leading: CircleAvatar(
                backgroundImage: AssetImage('assets${countries[index].flag}'),
              ),
            )

          );
        },
      )
    );
  }
}
