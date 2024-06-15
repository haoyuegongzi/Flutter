import 'package:flutter/material.dart';

class CupertinoPageRouteAndTheme1 extends StatefulWidget {
  const CupertinoPageRouteAndTheme1({super.key});

  @override
  State<CupertinoPageRouteAndTheme1> createState() =>  SearchFunction();
}

class SearchFunction extends State<CupertinoPageRouteAndTheme1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "iOS风格下注册的第一个页面", style: TextStyle(
            fontSize: 16,
            color: Colors.pink
          ),
        ),
      ),

      body:  OutlinedButton(
        onPressed: () {
          Map argumentsMap = {
            "title": "iOS风格下 去 注册的第2个 路由页面",
            "aid": 51
          };
          print(argumentsMap);
          // 下面两种方式都是可以成功跳转的。
          // Navigator.of(context).pushNamed("/second",
          //     arguments: argumentsMap
          // );
          Navigator.pushNamed(context, "/second",
              arguments: argumentsMap
          );
        },
        child: const Text(
            "命名路由传值：去 注册的第2个 路由页面",
            style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlueAccent,
                fontStyle: FontStyle.normal)
        ),
      ),
    );
  }
}







































