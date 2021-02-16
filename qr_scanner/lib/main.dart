import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/home_page.dart';
import 'package:qr_scanner/src/pages/view_maps_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'map' : (BuildContext context) => ViewMapsPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepPurpleAccent)
      ),
    );
  }
}