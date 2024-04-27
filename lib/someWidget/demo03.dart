import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: const Text("Flutter demo03")
      ),
      body:const HomeWidget(),
    ),
  ));
}

class HomeWidget extends StatelessWidget{
  const HomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "我是一个文本",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          // color: Colors.yellow,
          color: Color.fromRGBO(122, 211, 121, 0.75),
        ),
      ),
    );
  }
}