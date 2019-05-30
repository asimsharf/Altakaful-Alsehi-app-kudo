import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("الرئيسية"),
      ),
      body: new Center(
        child: new Text("مرحباً بكم!"),
      ),
    );
  }
}
