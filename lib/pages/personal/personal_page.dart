import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  State createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('PersonalPage'))),
    );
  }
}
