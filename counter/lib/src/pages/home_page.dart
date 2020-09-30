import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final textStyle = TextStyle(fontSize: 25);

  int count = 13;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola mechi'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Numero de clicks:', style: textStyle),
          Text('$count', style: textStyle)
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          // mini: true
          onPressed: () => {},
          elevation: 15),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
