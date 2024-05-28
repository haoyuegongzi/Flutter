import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers_by_name/Category.dart';
import 'package:learnflutterdemo/routers_by_name/ItemHomePage.dart';
import 'package:learnflutterdemo/routers_by_name//ItemBillOrder.dart';
import 'package:learnflutterdemo/routers_by_name/ItemEmergency.dart';
import 'package:learnflutterdemo/routers_by_name/ItemMine.dart';
import 'package:learnflutterdemo/routers_by_name/SearchPageByName.dart';

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
      routes: {
        "/home":(context)=>const ItemHomePage(),
        "/bill":(context)=>const ItemBillOerder(),
        "/emergency":(context)=>const ItemEmergency(),
        "/category":(context)=>const Category(),
        "/search":(context)=>const SearchPageByName(),
        // 上面三行的写法 跟 下面的写法是一样的作用
        "/mine":(context) {
          return const ItemMinePage();
        }
      },
      home: const ItemHomePage()
    );
  }
}





















