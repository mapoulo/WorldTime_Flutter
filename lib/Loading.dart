import 'package:flutter/material.dart';
import 'package:practiceflutter/WorlTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {


  String loading = "Loading ...";

  void setUpWorldTime()async{


    WorldTime instance = WorldTime(location: 'Johannesburg', url: 'Africa/Johannesburg', flag: '');
  await instance.getTime();

  Navigator.pushNamed(context, '/Home', arguments: {

  'location': instance.location,
  'time':instance.time,
  'flag':instance.flag,
  'url':instance.url

  });

  }

void initState(){
    super.initState();
    setUpWorldTime();
}

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

//      appBar:  AppBar(
//        title: Text('Laoding Page', style: TextStyle(color: Colors.white),),
//        centerTitle: true,
//        backgroundColor: Colors.grey[900],
//      ),


      body: Center(
        child: SpinKitCircle(
          color: Colors.grey,
          size: 50.0,
        ),
      )
    );


  }
}
