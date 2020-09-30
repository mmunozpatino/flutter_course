

import 'dart:io';

import 'package:desings/src/pages/basic_page.dart';
import 'package:desings/src/pages/buttons_page.dart';
import 'package:desings/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: ( Platform.isAndroid ) ? Colors.transparent : Colors.white
    ));
    
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'button',
      routes: {
        'basic': (BuildContext context) => BasicPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'button': (BuildContext context) => ButtonsPage()
      },
    );
  }
}