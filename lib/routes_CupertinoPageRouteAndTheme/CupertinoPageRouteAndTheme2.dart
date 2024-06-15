import 'package:flutter/material.dart';

class CupertinoPageRouteAndTheme2 extends StatefulWidget {
  const CupertinoPageRouteAndTheme2({super.key});

  @override
  State<CupertinoPageRouteAndTheme2> createState() =>  SearchFunction();
}

class SearchFunction extends State<CupertinoPageRouteAndTheme2> {
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
              "title": "iOS风格下 去 注册的第3个 路由页面",
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







































