import 'package:appdentista/home_page.dart';
import 'package:flutter/material.dart';


final ThemeData temaPadrao = ThemeData(
  primaryColor: Color.fromARGB(255, 39, 114, 176),
  hintColor: Color.fromARGB(255, 79, 155, 241)
);



void main() => runApp(MaterialApp(

  home: home_page(),
  theme: temaPadrao,
  debugShowCheckedModeBanner: false,
  
));
