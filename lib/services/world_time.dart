import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  String location;
  String time;  //time on location
  String flag;  //url of flag
  String url; //location using API
  bool isDay;   //to see if it is day or night
  WorldTime({this.location,this.flag,this.url});


  Future<void> getTime() async
  {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3),offset1=data['utc_offset'].substring(4, 6);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offset1)));

      isDay = now.hour> 6 && now.hour <20 ? true: false;  //day or night

      time = DateFormat.jm().format(now); //Time setted
    }
    catch(e){
      time = 'Not able to Load';
    }
  }
}

