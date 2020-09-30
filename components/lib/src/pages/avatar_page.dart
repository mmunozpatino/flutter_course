import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.cinepremiere.com.mx/wp-content/uploads/2018/07/stanleeanimado.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.pink,
            ),
          )
        ],
        
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage('https://cronicaglobal.elespanol.com/uploads/s1/25/60/75/4/deadpool.jpeg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          )
        )
    );
  }
}