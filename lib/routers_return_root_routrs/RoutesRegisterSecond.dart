import 'package:flutter/material.dart';

class RoutesRegisterSecond extends StatefulWidget {
  const RoutesRegisterSecond({super.key});

  @override
  State<RoutesRegisterSecond> createState() =>  SearchFunction();
}

class SearchFunction extends State<RoutesRegisterSecond> {
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
              "title": "去 注册的第3个 路由页面",
              "aid": 61
            };
            print(argumentsMap);
            Navigator.pushNamed(context, "/third",
                arguments: argumentsMap
            );
          },
          child: const Text(
              "命名路由传值：去 注册的第3个 路由页面",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.pink,
                  fontStyle: FontStyle.normal)
          ),
        ),
    );
  }
}







































