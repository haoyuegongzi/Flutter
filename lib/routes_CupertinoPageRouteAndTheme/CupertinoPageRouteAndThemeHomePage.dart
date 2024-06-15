import 'package:flutter/material.dart';

class CupertinoPageRouteAndThemeHomePage extends StatefulWidget {
  const CupertinoPageRouteAndThemeHomePage({super.key});

  // 写法一：
  @override
  State<CupertinoPageRouteAndThemeHomePage> createState() => HomePageFunction();

// 写法二：
// @override
// State<StatefulWidget> createState() {
//   return HomePageFunction();
// }
}

// 路由跳转：普通的路由跳转
class HomePageFunction extends State<CupertinoPageRouteAndThemeHomePage> {
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
            OutlinedButton(
              onPressed: () {
                Map argumentsMap = {
                  "title": "去 注册的第一个 路由页面",
                  "aid": 41
                };
                print(argumentsMap);
                // 下面两种方式都是可以成功跳转的。
                Navigator.of(context).pushNamed("/first",
                    arguments: argumentsMap
                );
                // Navigator.pushNamed(context, "/values",
                //     arguments: argumentsMap
                // );

              },
              child: const Text(
                  "命名路由传值：去 注册的第一个 路由页面",
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