import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty ? data :ModalRoute.of(context).settings.arguments;

    //set image
    String bgimg = data['isDay'] ? 'day.jpeg' : 'night.jpeg';
    Color bgcolor = data['isDay'] ? Colors.lightBlue[150]: Colors.indigo;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image : DecorationImage(
              image : AssetImage('asset/$bgimg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  label: Text('Edit'),
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location' : result['location'],
                       'isDay' : result['isDay'],
                       'flag' : result['flag']
                     };
                   });
                  },
                  icon: Icon(Icons.edit_location),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 65.0,
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
