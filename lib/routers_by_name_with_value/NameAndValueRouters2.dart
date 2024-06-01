import 'package:flutter/material.dart';

import 'package:learnflutterdemo/routers_by_name_with_value/ItemHomePage.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/utils/routers.dart';

void main() {
  runApp(const RoutersName());
}

class RoutersName extends StatelessWidget {

  const RoutersName({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "基本的命名路由",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      color: Colors.lightBlueAccent,
      initialRoute: "/",
      // 这里我们将 路由 抽离出来，独立成一个专门的 dart 文件，类似 Java 的 工具类；
      onGenerateRoute: onGenerateRoute,
      home: const ItemHomePage()
    );
  }
}





















