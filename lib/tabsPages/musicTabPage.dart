
import 'package:flutter/material.dart';

class MusicTabPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Body()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
/// This is the stateless widget that the main application instantiates. xd
///
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('This is Music Page',style: TextStyle(color: Colors.white),);
  }
}
