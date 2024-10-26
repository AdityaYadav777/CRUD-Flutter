
import 'package:datatest/_home_page_.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.purple,
       primarySwatch:Colors.purple 
      ),
      home: HomePage()
    );
  }
}