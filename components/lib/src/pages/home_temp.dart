import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page Temp'),
        ),
        body: ListView(children: _createItemsShort()));
  }

  // List<Widget> _createItem() {
  //   List<Widget> list = List<Widget>();

  //   for (String opt in options) {
  //     final tempWidget = ListTile(title: Text(opt));

  //     list..add(tempWidget)..add(Divider());
  //   }

  //   return list;
  // }

  List<Widget> _createItemsShort() {
    return options.map((e) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e + '!'),
            subtitle: Text('sub'),
            leading: Icon(Icons.beenhere),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
