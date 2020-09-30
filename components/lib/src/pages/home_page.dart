import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Components')), body: _list());
  }

  Widget _list() {
    return FutureBuilder(
        future: menuProvider.loadData(),
        //optional arg
        initialData: [],
        // wiating ondata onfailed se ejecuta
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          // print('builder');
          // print(snapshot.data);
          return ListView(children: _createListItems(snapshot.data, context));
        });
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options= [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.deepPurple),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
          // final route =MaterialPageRoute(
          //   builder: (context){
          //     return AlertPage();
          //   }
          //   );
          // Navigator.push(context, route);
        }
      );
      options..add(widgetTemp)
              ..add(Divider());
    });

    return options;
  }
}
