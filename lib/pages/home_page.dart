import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        Text('文本组件1'),
        Text('文本组件2'),
        Text('文本组件3'),
        Text('文本组件4'),
        Text('文本组件5'),
      ],),)
    );
  }
}

