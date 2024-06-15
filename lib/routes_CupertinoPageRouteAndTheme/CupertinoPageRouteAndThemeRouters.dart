import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndTheme1.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndTheme2.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndTheme3.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndTheme4.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndThemeBillOrder.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndThemeEmergency.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndThemeHomePage.dart';
import 'package:learnflutterdemo/routes_CupertinoPageRouteAndTheme/CupertinoPageRouteAndThemeMine.dart';

// 比如我们从 RootRoutrsHomePage 转到 registerFirst 页面，然后从 registerFirst 页面跳转到 registerSecond 页面，
// 然后从 registerSecond 跳转到 registerThird 页面。这个时候我们想的是 registerThird 注册成功后返回到
// RootRoutrsHomePage。 这个时候就用到了返回到根路由的方法：pushAndRemoveUntil()

void main() {
  runApp(CupertinoPageRouteAndThemeRouters());
}

class CupertinoPageRouteAndThemeRouters extends StatelessWidget {
  final Map<String,Function> routesMap = {
    "/home": (context, {arguments})=>const CupertinoPageRouteAndThemeHomePage(),
    "/bill": (context, {arguments})=>const CupertinoPageRouteAndThemeBillOrder(),
    "/emergency": (context, {arguments})=>const CupertinoPageRouteAndThemeEmergency(),
    "/mine": (context, {arguments})=>const CupertinoPageRouteAndThemeMine(),
    "/first": (context, {arguments})=>const CupertinoPageRouteAndTheme1(),
    "/second": (context, {arguments})=>const CupertinoPageRouteAndTheme2(),
    "/third": (context, {arguments})=>const CupertinoPageRouteAndTheme3(),
    "/register": (context, {arguments})=>CupertinoPageRouteAndTheme4(valuesRoute:arguments)
    // 注意，注意，注意：context 后面的参数，必须是/只能是/唯一的 “arguments”；
    //                RoutesRegisterValues 的构造方法里面的 入参，必须跟 RoutesValues 的class类里面定义的一致；
    // 否则，会有意想不到的错误；这个算是固定写法；
  };

  CupertinoPageRouteAndThemeRouters({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "基本的命名路由",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      color: Colors.lightBlueAccent,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings){
        final String? name = settings.name;
        final Function? pageContentBuilder = routesMap[name];

        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            // 这里，将 适配于 Android 的 MaterialPageRoute 风格路由，替换为适配了 iOS 的 CupertinoPageRoute 路由；
            // 特点是 界面切换时的风格不一样：Android 的 上下 / 闪一下 切换为 iOS 的  左右滑动切换；
            final Route route = CupertinoPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route =
            CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
        print("RoutesSearchPageByName()");
        return  null;
      },
      home: const CupertinoPageRouteAndThemeHomePage()
    );
  }
}





















