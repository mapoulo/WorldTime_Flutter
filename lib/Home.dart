import 'package:flutter/material.dart';
import 'WorlTime.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {


  Map data = {};

  @override
  Widget build(BuildContext context) {


    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 210.0, 0.0, 0.0),
          child: Column(

            children: <Widget>[

              FlatButton.icon(

                  onPressed: ()async{

                    dynamic result = await Navigator.pushNamed(context, '/ChooseLocation');

                    setState(() {

                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime']
                      };


                    });
                Navigator.pushNamed(context, '/ChooseLocation');


              }, icon: Icon(Icons.location_on), label: Text(
                'Choose Location'
              )),


              SizedBox(height: 40),


                Text(
                data['location'],
                style: TextStyle(
                    fontSize: 40.0
                ),
              ),

            SizedBox(height: 40),

              CircleAvatar(
                backgroundImage: AssetImage('assets/${data['flag']}'),
                radius: 40.0,
              ),

              SizedBox(height: 40),

              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 40.0
                ),
              ),




            ],
          ),
        ),
      )
    );
  }
}
