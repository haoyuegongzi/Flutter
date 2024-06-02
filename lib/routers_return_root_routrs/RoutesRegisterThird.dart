import 'package:flutter/material.dart';

class RoutesRegisterThird extends StatefulWidget {
  const RoutesRegisterThird({super.key});

  @override
  State<RoutesRegisterThird> createState() =>  SearchFunction();
}

class SearchFunction extends State<RoutesRegisterThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "搜索功能", style: TextStyle(
            fontSize: 16,
            color: Colors.pink
          ),
        ),
      ),

      body: OutlinedButton(
        onPressed: () {
          Map argumentsMap = {
            "title": "去 RoutesRegisterValues 注册路由页面",
            "aid": 71
          };
          print(argumentsMap);
          Navigator.pushNamed(context, "/register",
              arguments: argumentsMap
          );
        },
        child: const Text(
            "命名路由传值：去 RoutesRegisterValues 注册路由页面",
            style: TextStyle(
                fontSize: 14,
                color: Colors.purple,
                fontStyle: FontStyle.normal)
        ),
      ),
    );
  }
}







































