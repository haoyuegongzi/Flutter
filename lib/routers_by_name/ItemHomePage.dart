import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers_by_name/Category.dart';

class ItemHomePage extends StatefulWidget {
  const ItemHomePage({super.key});

  // 写法一：
  @override
  State<ItemHomePage> createState() => HomePageFunction();

// 写法二：
// @override
// State<StatefulWidget> createState() {
//   return HomePageFunction();
// }
}

// 路由跳转：普通的路由跳转
class HomePageFunction extends State<ItemHomePage> {
  // final SearchPageWithObject mSearchPageObj = SearchPageWithObject(mTitle:"带参路由跳转");
  // 因为 在 SearchPageWithObject 的构造方法中，已经给 mTitle 赋值了一个默认值，因此，在这里，构造方法中，可以传值，可以不传值。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "学习基本命名路由跳转",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Category();
                }));
              },
              child: const Text(
                  "通过基本路由跳转去Category页面",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal,
                      fontStyle: FontStyle.normal)
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                print("命名路由 跳转去search页面");
                Navigator.of(context).pushNamed("/search");
              },
              child: const Text(
                  "通过命名路由 跳转去search页面",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal,
                      fontStyle: FontStyle.normal)
              ),
            ),
            const Divider(),
            OutlinedButton(
              onPressed: () {
                print("功能还未开发");
              },
              child: const Text(
                  "功能还未开发",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal,
                      fontStyle: FontStyle.normal)
              ),
            )
          ],
        )
      ),
    );
  }
}
