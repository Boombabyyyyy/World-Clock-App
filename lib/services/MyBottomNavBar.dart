import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 65.0,
      padding: EdgeInsets.only(top: 5.0, bottom: 30.0),
      color: Colors.lightBlueAccent[100],

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.watch_later_sharp, size: 50.0,), onPressed: (){
            Navigator.pushReplacementNamed(context, '/');
          }),
          FlatButton.icon(
            onPressed: () async {
              dynamic result =  await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'isDayTime': result['isDayTime'],
                  'flag': result['flag'],
                };
              });
            },
            icon: Icon(
              Icons.edit_location,
              color: Colors.black,
              size: 50.0,
            ),
            label: Text(''),
          ),
        ],
      ),
    );
  }
}
