import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage')
      ),
      body: Container(
        
      ),
      floatingActionButton: _renderButton(context),
    );
  }

  Widget _renderButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: (){
        Navigator.pushNamed(context, 'vip');
      },
    );
  }
}