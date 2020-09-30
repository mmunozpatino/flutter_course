import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo1(),
            SizedBox(
              height: 30.0,
            ),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.deepPurple),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'esta es la descripción hiper larga de la tarjeta para ver que quiere mostranos el colombiano'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
                textColor: Colors.deepPurple,
              ),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {},
                color: Colors.deepPurple,
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
              // fadeInDuration: Duration(microseconds: 100),
              height: 300.0,
              fit: BoxFit.cover),
          // Image(
          //   image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg')
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea de que poner'))
        ],
      ),
      
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.5,
            spreadRadius: 3.0,
            // offset: Offset(10, 10)
          )
        ],
        color: Colors.white
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
      ), 
    );
  }
}
