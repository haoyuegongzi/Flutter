import 'package:flutter/material.dart';

class CupertinoPageRouteAndTheme3 extends StatefulWidget {
  const CupertinoPageRouteAndTheme3({super.key});

  @override
  State<CupertinoPageRouteAndTheme3> createState() =>  SearchFunction();
}

class SearchFunction extends State<CupertinoPageRouteAndTheme3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "iOS风格下搜索功能", style: TextStyle(
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







































