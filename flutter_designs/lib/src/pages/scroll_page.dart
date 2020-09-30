import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _page1(),
          _page2()
        ],
      )
    );
  }

  Widget _page1() {
    return Stack(
      //respeta como pila el orden del arreglo
      children: <Widget>[
        _backGroundColor(),
        _backgroundImage(),
        _texts()
      ],
    );
  }

  Widget _page2() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          //util para hacer rápido los bordes redondeados!
          shape: StadiumBorder(),
          textColor: Colors.white,
          color: Colors.blueGrey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text("Bienvenidos", style: TextStyle(fontSize: 20.0))
          ),
          onPressed: () {},
        ),
      )
    );
  }

  Widget _backGroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0)
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover
      ),
    );
  }

  Widget _texts() {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 50.0
    );
    return SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text('11º', style: textStyle),
          Text('Miercoles', style: textStyle),
          //crece para los costados y para arriba, nos centró de paso 
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }
}