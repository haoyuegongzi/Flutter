import 'package:flutter/material.dart';

class RoutesRegisterFirst extends StatefulWidget {
  const RoutesRegisterFirst({super.key});

  @override
  State<RoutesRegisterFirst> createState() =>  SearchFunction();
}

class SearchFunction extends State<RoutesRegisterFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "注册的第一个页面", style: TextStyle(
            fontSize: 16,
            color: Colors.pink
          ),
        ),
      ),

      body:  OutlinedButton(
        onPressed: () {
          Map argumentsMap = {
            "title": "去 注册的第2个 路由页面",
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







































