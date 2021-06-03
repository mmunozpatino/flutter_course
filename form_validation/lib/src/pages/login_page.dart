import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          _createBackground(context),
          _createLoginForm(context)
        ]
      )
    );
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final bg =  Container(
      height: size.height * .45,
      width: double.infinity, //toma todo el ancho de la pantalla
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 168, 1.0)
          ]
        )
      ),
    );

    final circles = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, .05)
      )
    );

    final icon =  Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Icon ( Icons.person_pin_circle, color: Colors.white, size: 100),
          SizedBox( height: 10, width: double.infinity), //hacemos que el column ocupe se centre!!
          Text('Mercedes Muñoz', style: TextStyle(color: Colors.white, fontSize: 25))
        ],
      ),
    );
    return Stack(
      children: <Widget>[
        bg,
        //podemos usar 3/4 coordenadas posibles
        Positioned( top: 90, left: 30, child: circles),
        Positioned( top: -40, right: -30, child: circles),
        Positioned( bottom: -50, right: -10, child: circles),
        Positioned( bottom: 120, right: 20, child: circles),
        Positioned( bottom: -50, left: -20, child: circles),
        icon
      ],
    );
  }

  Widget _createLoginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          //protegemos que podamos empezar donde nos vamos a ver bien!
          SafeArea(
            child: Container(
              height: 180,
            )
          ),
          Container(
            width: size.width * .85,
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0, 
                  offset: Offset(0,5),
                  spreadRadius: 3
                ), //el numero del final es la opacidad
              ]
            ),
            child: Column(
              children: [
                Text('Ingreso', style: TextStyle(fontSize: 20)),
                SizedBox( height: 45),
                _emailInput(bloc),
                SizedBox( height: 15),
                _passInput(bloc),
                SizedBox( height: 30),
                _createBotton(bloc),
              ],
            )
          ),
          Text('Olvide mi clave'),
          SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget _emailInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.alternate_email, color: Colors.deepPurple),
              hintText: 'ejemplo@correo.com',
              labelText: 'Mail',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,

          )
        );
      }
    );
  }
  
  Widget _passInput(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePass,
          )
        );
      }
    );
    
  }

  Widget _createBotton(LoginBloc bloc) {

    return StreamBuilder( 
      stream: bloc.isValidForm,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            child: Text('ingresar')
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          elevation: 0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () =>_login(bloc, context) : null
        );
      }
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('=================' );
    print('Email: ' + bloc.email );
    print('Pass: ' + bloc.pass);
    print('=================');
    Navigator.pushNamed(context, 'home');
  }
}