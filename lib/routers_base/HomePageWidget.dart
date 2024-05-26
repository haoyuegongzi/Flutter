import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers_base/SearchPage.dart';
import 'package:learnflutterdemo/routers_base/SearchPageWithObject.dart';
import 'package:learnflutterdemo/routers_base/SearchPageWithValue.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  // 写法一：
  @override
  State<StatefulWidget> createState() => HomePageFunction();

// 写法二：
// @override
// State<StatefulWidget> createState() {
//   return HomePageFunction();
// }
}

// 路由跳转：普通的路由跳转
class HomePageFunction extends State<HomePageWidget> {
  // final SearchPageWithObject mSearchPageObj = SearchPageWithObject(mTitle:"带参路由跳转");
  // 因为 在 SearchPageWithObject 的构造方法中，已经给 mTitle 赋值了一个默认值，因此，在这里，构造方法中，可以传值，可以不传值。
  final SearchPageWithObject mSearchPageObj = SearchPageWithObject();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // 路由跳转：普通的路由跳转
            // 通过 Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) { /** TODO **/ }))
            // 实现界面跳转；
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
              // 跳转过去之后，会在 SearchPage 界面自动给我们添加一个 “返回按钮”。
              return const SearchPage();
            }
                // 或者：
                // 跳转过去之后，会在 SearchPage 界面自动给我们添加一个 “返回按钮”。通过这个返回按钮，我们就可以 返回上一个界面。
                // builder: (BuildContext context) => const SearchPage();

                ));
          },
          child: const Text("跳转去SearchPage页面"),
        ),
        const Divider(),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>
                  const SearchPageWithValue(mTitle : "从HomePage的TextButton跳过来")
            ));
          },
          child: const Text("跳转去 SearchPageWithValue 界面"),
          
        ),
        const Divider(),
        OutlinedButton(
          onPressed: () {
            mSearchPageObj.mTitle = "动态传值过来的";
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return mSearchPageObj;
              })
            );
          },
          child: const Text("通过对象，去 SearchPageWithObject界面"),
        )
      ],
    ));
  }
}
