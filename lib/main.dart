import 'package:flutter/material.dart';
import 'package:home_beautiful2/components/buttonBar.dart';
import 'package:home_beautiful2/screens/LogIn.dart';
import 'package:home_beautiful2/screens/SignUp.dart';
import 'home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
       routes: <String, WidgetBuilder> {
      '/signUp': (BuildContext context) => SignUp(),
      '/logIn': (BuildContext context) => LogIn(),
      '/buttonBar': (BuildContext context) => buttonBar(selectedIndex: 0,),
    },
    );
  }
}