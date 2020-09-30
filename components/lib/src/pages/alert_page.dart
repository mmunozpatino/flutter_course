import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Page")),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.deepPurple,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _showAlert(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive),
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  void _showAlert(BuildContext context){
    showDialog(
      context: context,
      //se cierra con el clic afuera
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0)
            ]
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: (){
                return Navigator.of(context).pop();
              },
              textColor: Colors.deepPurple,
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.deepPurple,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            )
            
          ],
        );
      }

    );
  }
}