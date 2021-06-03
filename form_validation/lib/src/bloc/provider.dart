import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';

//puede manejar VARIOS blocs
class Provider extends InheritedWidget {
  //singleton del loginBloc
  final loginBloc = LoginBloc();

  Provider({Key key, Widget child}) 
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of( BuildContext context ) {
    //bucas hasta encontrar la instancia que existe
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

}