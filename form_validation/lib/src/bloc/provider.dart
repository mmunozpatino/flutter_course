import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';

//puede manejar VARIOS blocs
class Provider extends InheritedWidget {

  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    if(_instance == null ) {
      _instance = Provider._internal(key: key, child: child);
    }
    return _instance;
  }

  Provider._internal({Key key, Widget child}) 
    : super(key: key, child: child);

  //singleton del loginBloc
  final loginBloc = LoginBloc();


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of( BuildContext context ) {
    //busca hasta encontrar la instancia que existe
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

}