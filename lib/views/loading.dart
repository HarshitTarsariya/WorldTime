import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async
  {
    WorldTime ins = WorldTime(location: 'India',flag: 'india.jpeg',url: 'Asia/Kolkata');
    await ins.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': ins.location,
      'flag': ins.flag,
      'time': ins.time,
      'isDay': ins.isDay
    });
  }

  @override
  void initState()
  {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
