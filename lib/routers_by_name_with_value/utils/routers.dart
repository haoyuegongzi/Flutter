import 'package:flutter/material.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/ItemEmergency.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/ItemBillOrder.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/ItemHomePage.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/RoutesCategory.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/RoutesSearchPageByName.dart';
import 'package:learnflutterdemo/routers_by_name_with_value/RoutesValues.dart';

final Map<String,Function> routesMap = {
  "/home": (context, {arguments})=>const ItemHomePage(),
  "/bill": (context, {arguments})=>const ItemBillOerder(),
  "/emergency": (context, {arguments})=>const ItemEmergency(),
  "/category": (context, {arguments})=>const RoutesCategory(),
  "/search": (context, {arguments})=>const RoutesSearchPageByName(),
  // 注意，注意，注意：context 后面的参数，必须是 / 只能是 / 唯一的 “arguments”；
  //                RoutesValues 的构造方法里面的 入参，必须跟 RoutesValues 的class类里面定义的一致；
  // 否则，会有意想不到的错误；这个算是固定写法；
  // 下面的 RoutesValues() 的构造方法中，参数 values 是 RoutesValues() 的构造方法中的 入参；
  //                                 参数 valuesRoute 则是 前面 指定的值类型
  "/RoutesValues": (context, {arguments}) => RoutesValues(valuesRoute: arguments),
};

Route<dynamic>? Function(RouteSettings) onGenerateRoute = (RouteSettings settings) {
  // 统一处理路由
  final String? name = settings.name;
  final Function? pageContentBuilder = routesMap[name];
  // 这里的 settings 里面封装的就是 方法  Navigator.of(context).pushNamed(String, {Object? arguments})的入参；
  // settings.name：是第一个入参，也就是 路由；settings.arguments：是第二个入参；也就是 传给下级界面的参数；
  print("settings.name: ${settings.name}, settings.arguments： ${settings.arguments}, ");
  print("settings: ${settings}");

  if (pageContentBuilder != null) {
    // 这里的跳转，分有参跳转和无参跳转；
    if (settings.arguments != null) {
      Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      //上面 这行代码 等价于下面的实现方式。不同的是，上面的代码是一种 动态实现，可以跳转到任何指定的界面；下面的，则只能跳转到特定界面；
      // MaterialPageRoute(
      //   builder: (context) {
      //     return const RoutesSearchPageByName();
      //   }
      // );
      return route;
    }
  }
  return null;
};


