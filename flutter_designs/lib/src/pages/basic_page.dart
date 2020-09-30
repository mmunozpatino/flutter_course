import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Center(
              child:
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                      _createImage(), 
                      _createHeader(),
                      _createActions(),
                      _createText(),
                      _createText(),
                      _createText(),
                      _createText(),
                      _createText(),
                    ]
                    )
                  )
          )
      ),
    );
  }

  Widget _createImage() {
    return Image(
      image:
          NetworkImage('https://i.ytimg.com/vi/9QNUXxuwt1Y/maxresdefault.jpg'),
        fit: BoxFit.cover,
    );
  }

  Widget _createHeader() {
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            // el expanded lo usamos para hacer que la columna de los textos use todo el espacio que tiene disponible
            Expanded(
              child: Column(
                  //cross "cruza" el elemento
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Lago con bosque",
                      style: titleStyle,
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      "La imagen me pintó y que?",
                      style: subtitleStyle,
                    )
                  ]),
            ),
            Icon(Icons.star, color: Colors.purple, size: 30.0),
            Text(
              "41",
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _createActions(){
    return Row(
      //cómo se ordenan de manera horizontal
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _createActionItem(Icons.call, "CALL"),
        _createActionItem(Icons.near_me, "ROUTE"),
        _createActionItem(Icons.share, "SHARE")
      ],
    );
  }

  Widget _createActionItem(IconData icon, String text){
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.purple,
          size: 40.0
        ),
        SizedBox(height: 5.0,),
        Text(
          text,
          style: TextStyle(
            color: Colors.purple,
            fontSize: 15.0
          )
        )
      ],
    );
  }

  Widget _createText(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
      child: Text(
        'Adipisicing ad sunt id do anim eiusmod duis officia mollit consectetur minim esse aliquip culpa. Consequat tempor consequat elit occaecat ex officia in enim tempor. Aliquip tempor velit do sit ad tempor anim quis velit occaecat adipisicing ea quis proident. Aliqua fugiat nisi dolor aute exercitation eiusmod. Cillum irure ipsum non id aliquip. Dolore laboris incididunt mollit aliquip non pariatur mollit.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
