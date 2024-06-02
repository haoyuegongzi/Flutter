import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RootRoutrsBillOrder.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RootRoutrsEmergency.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RootRoutrsHomePage.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RootRoutrsMine.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RoutesRegisterFirst.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RoutesRegisterSecond.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RoutesRegisterThird.dart';
import 'package:learnflutterdemo/routers_return_root_routrs/RoutesRegisterValues.dart';

// 比如我们从 RootRoutrsHomePage 转到 registerFirst 页面，然后从 registerFirst 页面跳转到 registerSecond 页面，
// 然后从 registerSecond 跳转到 registerThird 页面。这个时候我们想的是 registerThird 注册成功后返回到
// RootRoutrsHomePage。 这个时候就用到了返回到根路由的方法：pushAndRemoveUntil()

void main() {
  runApp(RoutersName());
}

class RoutersName extends StatelessWidget {
  final Map<String,Function> routesMap = {
    "/home": (context, {arguments})=>const RootRoutrsHomePage(),
    "/bill": (context, {arguments})=>const RootRoutrsBillOrder(),
    "/emergency": (context, {arguments})=>const RootRoutrsEmergency(),
    "/mine": (context, {arguments})=>const RootRoutrsMine(),
    "/first": (context, {arguments})=>const RoutesRegisterFirst(),
    "/second": (context, {arguments})=>const RoutesRegisterSecond(),
    "/third": (context, {arguments})=>const RoutesRegisterThird(),
    "/register": (context, {arguments})=>RoutesRegisterValues(valuesRoute:arguments)
    // 注意，注意，注意：context 后面的参数，必须是/只能是/唯一的 “arguments”；
    //                RoutesRegisterValues 的构造方法里面的 入参，必须跟 RoutesValues 的class类里面定义的一致；
    // 否则，会有意想不到的错误；这个算是固定写法；
  };

  RoutersName({super.key});

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
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            print("settings.arguments != null: ${settings.arguments}");
            return route;
          } else {
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            print("settings.arguments == null");
            return route;
          }
        }
        print("RoutesSearchPageByName()");
        return  MaterialPageRoute(builder: (context) => const RoutesRegisterFirst());
      },
      home: const RootRoutrsHomePage()
    );
  }
}





















