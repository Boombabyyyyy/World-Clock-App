import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; // the time in that location
  String flag; // url to flag icon
  String url; // location url for api endpoint
  bool isDayTime; // true or false if day and night

  WorldTime({this.location, this.flag, this.url});

  Future<void>getTime() async {

    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    String offset2 = data['utc_offset'].substring(4,6);
    // print(datetime);
    // print(offset2);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset) ));
    now = now.add(Duration(minutes: int.parse(offset2) ));

    // set time property
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
    time = DateFormat.jm().format(now);

  }
}