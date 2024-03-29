import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          const url = 'meli://cart?showSavedItems=false';

          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
      );
  }
}