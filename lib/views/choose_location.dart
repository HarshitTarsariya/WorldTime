import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',location: 'London' , flag: 'london.jpeg'),
    WorldTime(url: 'Asia/Kolkata',location: 'India' , flag: 'india.jpeg'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin' , flag: 'berlin.jpeg'),
    WorldTime(url: 'Asia/Hong_Kong',location: 'Hong Kong' , flag: 'hongkong.jpeg'),
    WorldTime(url: 'Asia/Dubai',location: 'Dubai' , flag: 'dubai.jpeg'),
    WorldTime(url: 'Asia/Tokyo',location: 'Tokyo' , flag: 'tokyo.jpeg'),
    WorldTime(url: 'Australia/Adelaide',location: 'Australia' , flag: 'australia.jpeg'),
    WorldTime(url: 'Asia/Bangkok',location: 'Bangkok' , flag: 'bangkok.jpeg'),
    WorldTime(url: 'America/Whitehorse',location: 'USA' , flag: 'usa.jpeg'),
    WorldTime(url: 'Africa/Johannesburg',location: 'Africa' , flag: 'africa.jpeg'),
  ];

  void updateTime(index) async{
      WorldTime ins = locations[index];
      await ins.getTime();
      Navigator.pop(context,{
        'location': ins.location,
        'flag': ins.flag,
        'time': ins.time,
        'isDay': ins.isDay
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('asset/${locations[index].flag}'),
              ),
            ),
          );
        },
      )
    );
  }
}
