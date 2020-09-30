import 'package:contador/src/pages/counter_page.dart';
// import 'package:contador/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build( context ) {

    return MaterialApp(
      home: Center(
        child: CounterPage()
      ),
      //hide the debug banner
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      
    );

  }
}