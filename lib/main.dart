import 'package:flutter/material.dart';
import 'package:worldtime/views/choose_location.dart';
import 'package:worldtime/views/loading.dart';
import 'package:worldtime/views/home.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) =>  ChooseLocation(),
  },
));